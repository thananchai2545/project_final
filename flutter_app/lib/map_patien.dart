import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';

class MapPatien extends StatefulWidget {
  const MapPatien({Key? key}) : super(key: key);

  @override
  _MapPatienState createState() => _MapPatienState();
}

class _MapPatienState extends State<MapPatien> {
  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();

  // GoogleMapController? _controller;

  // void _onMapCreated(GoogleMapController controller) {
  //   _controller = controller;
  // }

  @override
  void initState() {
    // _userLocation();
    super.initState();
    // print(_currentPosition!.latitude);
    // _getCurrentLocation();
  }

  // Position? _currentPosition;
  // Future<Position?> _getAddres(LatLng position) async {
  //   List<Placemark> placemarks =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);
  //   Placemark address = placemarks[0];
  //   String addressStr = "${address.locality}";
  // }

  // Future<Position?> _userLocation() async {
  //   try {
  //     _currentPosition = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.best);
  //   } catch (e) {
  //     _currentPosition = null;
  //   }
  //   return _currentPosition;
  // }

  // final Position latLng = (_);
  // final List<Marker> _markers = [];
  @override
  Widget build(BuildContext context) {
    // print(_currentPosition);
    return Scaffold(
        appBar: AppBar(
          title: RichText(
            // textAlign: TextAlign.center,
            text: const TextSpan(
                text: "เลือกจุดเกิดเหตุ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\nแสดงจุดเกิดอุบัติเหตุ',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ]),
          ),
          backgroundColor: Colors.grey,
        ),
        // body:
        // body: Container(
        //   child: FutureBuilder(
        //     future: _userLocation(),
        //     builder: (BuildContext context, AsyncSnapshot snapshot) {
        //       if (snapshot.hasData) {
        //         return GoogleMap(
        //           mapType: MapType.normal,
        //           onMapCreated: (controller) {
        //             final marker = Marker(
        //               markerId: MarkerId('0'),
        //               position: LatLng(_currentPosition!.latitude,
        //                   _currentPosition!.longitude),
        //             );

        //             _markers.add(marker);
        //           },
        //           onCameraMove: (position) {
        //             setState(() {
        //               _markers.first = _markers.first
        //                   .copyWith(positionParam: position.target);
        //             });
        //           },
        //           markers: _markers.toSet(),
        //           myLocationEnabled: true,
        //           initialCameraPosition: CameraPosition(
        //               target: LatLng(_currentPosition!.latitude,
        //                   _currentPosition!.longitude),
        //               zoom: 15),
        //         );
        //       } else {
        //         return Center(
        //           child: Column(
        //             children: [CircularProgressIndicator()],
        //           ),
        //         );
        //       }
        //     },
        //   ),
        // ),
        // Center(
        //   child: Text('${_currentPosition!.latitude.toDouble()}'),
        // )
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xff32303b)),
              foregroundColor: MaterialStateProperty.all(Colors.redAccent),
              minimumSize: MaterialStateProperty.all(Size(150, 45)),
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            onPressed: () {},
            child: Text('ถัดไป'),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}
