import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Test extends StatefulWidget {
  LatLng? draggedPosition;
  Test({super.key, required this.draggedPosition});

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  GoogleMapController? _mapController;
  Position? position;
  late LatLng _currentPosition;
  late LatLng _draggedPosition; // Position to track the camera movement

  bool _loading = true;
  bool isExpanded = false;

  @override
  void initState() {
    if (widget.draggedPosition == null) {
      _getUserLocation();
      print('object');
    } else {
      _draggedPosition = widget.draggedPosition!;
      _currentPosition = widget.draggedPosition!;
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

  // void _onCameraIdle() {
  //   // Update marker position when dragging is stopped
  //   setState(() {
  //     _markers.clear();
  //     _markers.add(
  //       Marker(
  //         markerId: MarkerId('draggedLocation'),
  //         position: _draggedPosition,
  //         infoWindow: InfoWindow(title: 'New Location'),
  //       ),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
        appBar: AppBar(
          title: const Text('ssss'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => context.push('/'),
          ),
          automaticallyImplyLeading: false,
        ),
        body: _loading
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
                        'path': '/test',
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
              ));
  }
}
