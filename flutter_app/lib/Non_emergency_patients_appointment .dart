import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NonEmergencyPatientsAppointment extends StatefulWidget {
  final Map<String, dynamic> data;
  const NonEmergencyPatientsAppointment({
    super.key,
    required this.data,
  });

  @override
  _NonEmergencyPatientsAppointmentState createState() =>
      _NonEmergencyPatientsAppointmentState();
}

class _NonEmergencyPatientsAppointmentState
    extends State<NonEmergencyPatientsAppointment> {
  TextEditingController address = TextEditingController();
  TextEditingController landmarks = TextEditingController();
  Map<String, dynamic> data = {};
  GoogleMapController? _mapController;
  Position? position;
  late LatLng _currentPosition;
  late LatLng _draggedPosition;
  bool _loading = true;
  bool isExpanded = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    data = widget.data;
    if (data?['location'] == null) {
      _getUserLocation();
    } else {
      _draggedPosition = data?['location'];
      _loading = false;
    }
    super.initState();
  }

  void _nextDestination() {
    if (_formKey.currentState!.validate()) {
      data.addAll({
        'address': address.text,
        'landmarks': landmarks.text,
        'lat': _draggedPosition.latitude,
        'lng': _draggedPosition.longitude
      });
      context.push('/non_emergency_patients/health/appointment/destination',
          extra: data);
    }
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
          // textAlign: TextAlign.center,
          text: const TextSpan(
              text: "ผู้ป่วยทั่ว",
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nข้อมูลที่อยู่',
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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('ที่อยู่ปัจจุบัน'),
                  subtitle: TextFormField(
                      controller: address,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณาระบุที่อยู่ปัจจุบัน';
                        }
                        return null;
                      }),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('จุดสังเกต'),
                  subtitle: TextFormField(
                    controller: landmarks,
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณาระบุจุดสังเกต';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('พิกัด'),
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
                                Map<String, dynamic> location = {
                                  'path':
                                      '/non_emergency_patients/health/appointment',
                                  'location': _draggedPosition
                                };
                                context.push('/map_screen', extra: location);
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
                            Positioned(
                              // left: 0,
                              // top: 0,

                              bottom: 10,
                              right: 10,
                              child: FloatingActionButton.extended(
                                onPressed: () {
                                  print(_draggedPosition);
                                },
                                elevation: 0,

                                label: Icon(Icons.my_location),
                                // icon:,
                              ),
                            ),
                          ]),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.green.shade600),
              foregroundColor: WidgetStateProperty.all(Colors.black87),
              minimumSize: WidgetStateProperty.all(const Size(150, 45)),
              elevation: WidgetStateProperty.all(0),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            onPressed: _nextDestination,
            child: Text("ถัดไป"),
          ),
        ),
      ),
    );
  }
}
