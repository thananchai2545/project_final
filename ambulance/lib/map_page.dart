import 'dart:convert';

import 'package:ambulance/constant/config.dart';
import 'package:ambulance/constant/token_maneger.dart';
import 'package:ambulance/model/map_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  MapPage({Key? key}) : super(key: key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late LatLng _currentPosition;
  bool _loading = true;
  Set<Polyline> _polylines = {};
  // late Position ;
  PolylinePoints polylinePoints = PolylinePoints();
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};
  late Future<MapLocation> mapLocation;

  @override
  void initState() {
    // _addPolylines();
    super.initState();

    mapLocation = getLocation();
    _getCurrentLocation();
  }

  Future<void> updateStatus(
      String status, String case_type, int case_id) async {
    final token = await AuthService().getToken();
    final id = await AuthService().getId();

    var response = await http.post(
        Uri.parse('${Config.API_URL}/api-ambulance/map/update_status'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'bearer ${token}'
        },
        body: jsonEncode({
          'id': id,
          "case_id": case_id.toString(),
          "case_status": status,
          "case_type": case_type
        }));
    if (response.statusCode == 200) {
      context.push('/');
    } else {
      print('error');
    }
  }

  Future<MapLocation> getLocation() async {
    // final position = await Geolocator.getCurrentPosition();
    final token = await AuthService().getToken();
    final id = await AuthService().getId();
    var response = await http.get(
        Uri.parse('${Config.API_URL}/api-ambulance/map/get_location/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'bearer ${token}'
        });
    if (response.statusCode == 200) {
      return MapLocation.fromJson(jsonDecode(response.body)['data'][0]);
    } else {
      return throw Exception('Failed to load data');
    }
  }

  _getCurrentLocation() async {
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
      // _getPolyline(_currentPosition);
      // _draggedPosition = LatLng(position.latitude, position.longitude);
      _loading = false;
    });

    // _mapController?.animateCamera(CameraUpdate.newLatLng(_currentPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: _loading
              ? Center(child: CircularProgressIndicator())
              : FutureBuilder(
                  future: mapLocation,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return snapshot.hasData
                        ? Stack(
                            children: [
                              GoogleMap(
                                mapType: MapType.normal,
                                myLocationEnabled: true,
                                zoomControlsEnabled: false,
                                initialCameraPosition: CameraPosition(
                                  target: _currentPosition,
                                  zoom: 16,
                                ),
                                // markers: {
                                //   Marker(
                                //       markerId: MarkerId("1"),
                                //       position: LatLng(
                                //           double.parse(snapshot.data.caseLat),
                                //           double.parse(snapshot.data.caseLng)),
                                //       infoWindow: InfoWindow(
                                //         title: "จุดเกิดเหตุ",
                                //       )),
                                // },
                                // polylines: Set<Polyline>.of(polylines.values),
                              ),
                              snapshot.data.caseStatus == 'departure'
                                  ? Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.all(20),
                                        child: FloatingActionButton.extended(
                                            onPressed: () {
                                              String case_type =
                                                  snapshot.data.caseType;
                                              int case_id =
                                                  snapshot.data.caseId;

                                              updateStatus('destination',
                                                  case_type, case_id);
                                            },
                                            label: Text('ถึงจุดหมาย')),
                                      ),
                                    )
                                  : snapshot.data.caseStatus == 'destination'
                                      ? Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: EdgeInsets.all(20),
                                            child:
                                                FloatingActionButton.extended(
                                                    onPressed: () {
                                                      String case_type =
                                                          snapshot
                                                              .data.caseType;
                                                      int case_id =
                                                          snapshot.data.caseId;
                                                      updateStatus('hospital',
                                                          case_type, case_id);
                                                    },
                                                    label:
                                                        Text('นำส่งโรงพยาบาล')),
                                          ),
                                        )
                                      : Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: EdgeInsets.all(20),
                                            child:
                                                FloatingActionButton.extended(
                                                    onPressed: () {
                                                      String case_type =
                                                          snapshot
                                                              .data.caseType;
                                                      int case_id =
                                                          snapshot.data.caseId;
                                                      updateStatus('complete',
                                                          case_type, case_id);
                                                    },
                                                    label: Text('เสร็จสิ้น')),
                                          ),
                                        )
                            ],
                          )
                        : Center(child: CircularProgressIndicator());
                  },
                )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
