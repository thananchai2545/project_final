import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  Map<String, dynamic> dataPatient;
  MapScreen({super.key, required this.dataPatient});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  LatLng _currentPosition = LatLng(37.42796133580664, -122.085749655962);
  LatLng _draggedPosition =
      LatLng(37.7749, -122.4194); // Position to track the camera movement

  bool _loading = true;
  final Set<Marker> _markers = {};
  late Map<String, dynamic> dataPatient;
  late String path;

  @override
  void initState() {
    super.initState();
    // _getUserLocation();
    dataPatient = widget.dataPatient;
    _draggedPosition = dataPatient['location'];
    path = dataPatient['path'];
    _loading = false;
  }

  Future<void> _getUserLocation() async {
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
      // _draggedPosition = LatLng(position.latitude, position.longitude);
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
        title: const Text('ssss'),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.only(bottom: 70),
              child: Stack(children: [
                GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: _draggedPosition,
                    zoom: 18.0,
                  ),
                  // markers: _markers,
                  myLocationEnabled: false,
                  onCameraMove: _onCameraMove, // Track camera movement
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
                  right: 10,
                  top: 10,
                  height: 50,
                  width: 50,
                  child: FloatingActionButton.extended(
                    onPressed: () async {
                      _getUserLocation();
                      // print(path);
                    },
                    elevation: 0,
                    label: const Icon(Icons.my_location),
                  ),
                ),
              ]),
            ),
      floatingActionButton: Container(
        // alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(right: 10, left: 10),
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
          onPressed: () {
            dataPatient['location'] = _draggedPosition;
            context.push(path, extra: dataPatient);
            // print(_draggedPosition);
          },
          child: const Text("ยืนยัน"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
