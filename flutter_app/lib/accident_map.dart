import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';

class AccidentMap extends StatefulWidget {
  // late AccidentModel? accidentModel;
  Map<String, dynamic>? dataPatient;

  //
  AccidentMap({
    super.key,
    @required this.dataPatient,
  });

  @override
  _AccidentMapState createState() => _AccidentMapState();
}

class _AccidentMapState extends State<AccidentMap> {
  final TextEditingController _landmarkController = TextEditingController();
  late Map<String, dynamic> dataPatient;
  // late LatLng? draggedPosition;
  GoogleMapController? _mapController;
  Position? position;
  late LatLng _currentPosition;
  late LatLng _draggedPosition; // Position to track the camera movement

  bool _loading = true;
  bool isExpanded = false;
  void accident_contact() {
    // dataPatient = widget.dataPatient!;
    print(_draggedPosition);
    dataPatient.addAll({
      "case_landmark": _landmarkController.text,
      "case_lat": _draggedPosition.latitude,
      "case_lng": _draggedPosition.longitude
    });

    context.push('/emergencypatient/accident/accident_map/accident_contact',
        extra: dataPatient);
  }

  @override
  void initState() {
    dataPatient = widget.dataPatient!;
    if (dataPatient['location'] == null) {
      _getUserLocation();
    } else {
      _draggedPosition = dataPatient['location'];
      _loading = false;
    }

    super.initState();
  }

  void _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check for permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _draggedPosition = LatLng(position.latitude, position.longitude);
      _loading = false;
    });

    _mapController?.animateCamera(CameraUpdate.newLatLng(_currentPosition));
  }

  void _onCameraMove(CameraPosition position) {
    setState(() {
      _draggedPosition = position.target;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
              text: "อุบัติเหตุ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nเลือกที่อยู่ของผู้ป่วย',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ]),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('ตำแหน่งที่เกิดเหตุ'),
                subtitle: _loading
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: Stack(children: [
                          GoogleMap(
                            onMapCreated: (GoogleMapController controller) {
                              _mapController = controller;
                            },
                            initialCameraPosition: CameraPosition(
                              target: _draggedPosition,
                              zoom: 18.0,
                            ),
                            zoomControlsEnabled: false,
                            // markers: _markers,
                            myLocationEnabled: false,
                            onCameraMove: _onCameraMove,
                            onTap: (LatLng latLng) {
                              dataPatient.addAll({
                                'path':
                                    '/emergencypatient/accident/accident_map',
                                'location': _draggedPosition
                              });
                              context.push('/map_screen', extra: dataPatient);
                            }, // Track camera movement
                            // onCameraIdle:
                            //     _onCameraIdle, // Called when user stops dragging
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            right: 0,
                            bottom: 40,
                            child: Center(
                                // child: Text("sssss"),
                                child: Image.asset(
                              'assets/images/pin-map.png',
                              height: 50,
                              width: 50,
                            )),
                          ),
                        ]),
                      )
                // TextFormField(
                //   // controller: _passwordController,
                //   style: TextStyle(color: Colors.black),
                //   keyboardType: TextInputType.text,
                //   decoration: InputDecoration(
                //       filled: true,
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(5))),
                // ),
                ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('จุดสังเกตุ'),
              subtitle: TextFormField(
                controller: _landmarkController,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Colors.green.shade600),
                  foregroundColor: WidgetStateProperty.all(Colors.black87),
                  minimumSize: WidgetStateProperty.all(const Size(150, 45)),
                  elevation: WidgetStateProperty.all(0),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: accident_contact,
                child: Text("ถัดไป"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
