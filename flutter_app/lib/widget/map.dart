import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map {
  static Container build({required}) {
    return Container(child: Text('adad'));
    // Container(
    //   // height: MediaQuery.of(context).size.height / 3,
    //   child: Stack(children: [
    //     GoogleMap(
    //       onMapCreated: (GoogleMapController controller) {
    //         // _mapController = controller;
    //       },
    //       initialCameraPosition: CameraPosition(
    //         target: _currentPosition,
    //         zoom: 18.0,
    //       ),
    //       zoomControlsEnabled: false,
    //       // markers: _markers,
    //       myLocationEnabled: true,
    //       onCameraMove: _onCameraMove,
    //       onTap: (LatLng latLng) {
    //         print('object');
    //       }, // Track camera movement
    //       // onCameraIdle:
    //       //     _onCameraIdle, // Called when user stops dragging
    //     ),
    //     Positioned(
    //       left: 0,
    //       top: 0,
    //       right: 0,
    //       bottom: 40,
    //       child: Center(
    //           // child: Text("sssss"),
    //           child: Image.asset(
    //         'assets/images/pin-map.png',
    //         height: 50,
    //         width: 50,
    //       )),
    //     ),
    //     Align(
    //       // left: 0,
    //       // top: 0,
    //       alignment: Alignment.bottomCenter,
    //       child: FloatingActionButton.extended(
    //         onPressed: () async {
    //           print(_draggedPosition);
    //         },
    //         elevation: 0,

    //         label: Icon(Icons.my_location),
    //         // icon:,
    //       ),
    //     ),
    //   ]),
    // );
  }
}
