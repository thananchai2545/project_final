import 'dart:convert';

import 'package:ambulance/constant/config.dart';
import 'package:ambulance/constant/token_maneger.dart';
import 'package:ambulance/model/non_emergency_model.dart';
import 'package:ambulance/model/tool_non_emergency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NonEmergencyDetail extends StatefulWidget {
  String id;
  NonEmergencyDetail({Key? key, required this.id}) : super(key: key);

  @override
  _NonEmergencyDetailState createState() => _NonEmergencyDetailState();
}

class _NonEmergencyDetailState extends State<NonEmergencyDetail> {
  bool _loading = true;
  late LatLng _currentPosition;
  @override
  void initState() {
    super.initState();
    // exacerbationModel = getData();
    _getCurrentLocation();
    getData();
    getTool();
  }

  Future<NonEmergencyModel> getData() async {
    final token = await AuthService().getToken();
    var response = await http.get(
        Uri.parse(
            '${Config.API_URL}/api-ambulance/non_emergency/get_case/${widget.id}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'bearer $token',
        });

    if (response.statusCode == 200) {
      return NonEmergencyModel.fromJson(jsonDecode(response.body)['data'][0]);
    } else {
      return throw Exception('Failed to load data');
    }
  }

  Future<List<ToolNonEmergencyModel>> getTool() async {
    final token = await AuthService().getToken();
    var response = await http.get(
        Uri.parse(
            '${Config.API_URL}/api-ambulance/non_emergency/get_tool/${widget.id}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'bearer $token',
        });

    if (response.statusCode == 200) {
      List data = await jsonDecode(response.body)['tool'].toList();
      // print(jsonDecode(response.body));
      return data.map((json) => ToolNonEmergencyModel.fromJson(json)).toList();
    } else {
      return throw Exception('Failed to load data');
    }
  }

  void confirm(int case_id, String lat, String lng, String case_type) async {
    final token = await AuthService().getToken();
    final id = await AuthService().getId();
    var response = await http.post(
      Uri.parse('${Config.API_URL}/api-ambulance/non_emergency/confirm'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $token',
      },
      body: jsonEncode({
        'id': id,
        'case_id': case_id,
        'case_lat': lat,
        'case_lng': lng,
        'case_type': case_type,
        'case_status': 'departure',
      }),
    );

    if (response.statusCode == 200) {
      context.push('/');
    } else {
      print(Exception('Failed to create album.'));
    }
  }

  String date_(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    return formattedDate;
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
        appBar: AppBar(
          title: const Text('รายละเอียด'),
        ),
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView(
                        // shrinkWrap: true,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text('ข้อมูลผู้ป่วย'),
                            trailing: Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: IconButton(
                                      icon: Icon(Icons.phone),
                                      onPressed: () async {
                                        final Uri _teleLaunchUri = Uri(
                                          scheme: 'tel',
                                          path:
                                              '${snapshot.data!.tel}', // your number
                                        );
                                        if (await canLaunchUrl(
                                            _teleLaunchUri)) {
                                          await launchUrl(_teleLaunchUri);
                                        } else {
                                          throw 'Could not launch $_teleLaunchUri';
                                        }
                                      }),
                                )),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'ชื่อ - นามสกุล: ${snapshot.data!.nameLastname}'),
                                Text('อายุ: ${snapshot.data!.age} '),
                                snapshot.data?.sex == 'man'
                                    ? Text('เพศ : ชาย')
                                    : snapshot.data?.sex == 'female'
                                        ? Text('เพศ : หญิง')
                                        : Text('เพศ : ไม่ระบุ'),
                              ],
                            ),
                          ),
                          const ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text('ข้อมูลอาการ'),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'อาการเบื้องต้น: ${snapshot.data!.symptom}'),
                                Text('โรคประจำตัว: ${snapshot.data!.disease}'),
                                Text(
                                    'ประวัติแพ้ยา: ${snapshot.data!.drugAllergy}'),
                                Text(
                                    'แพทย์รักษาประจำ: ${snapshot.data!.doctor}'),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                                'ส่งผู้ป่วยที่: ${snapshot.data!.hospitalName}'),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'วันที่ต้องการใช้บริการ : ${date_(snapshot.data!.dateService.toString())}'),
                                    Text(
                                        'เวลาที่ต้องการใช้บริการ : ${snapshot.data!.timeService}'),
                                    Text('ที่อยู่ : '),
                                    Text('${snapshot.data!.address}'),
                                    Text(
                                        'จุดสังเกต : ${snapshot.data!.landmark}'),
                                  ])),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                  'เจ้าหน้าที่รับเคส : ${snapshot.data!.userName} ${snapshot.data!.userLastname}')),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: _loading
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : GoogleMap(
                                      myLocationEnabled: true,
                                      mapType: MapType.normal,
                                      initialCameraPosition: CameraPosition(
                                        target: _currentPosition,
                                        zoom: 18,
                                      ),
                                      markers: {
                                        Marker(
                                          markerId: MarkerId('id-1'),
                                          position: LatLng(
                                            double.parse(
                                                snapshot.data!.lat as String),
                                            double.parse(
                                                snapshot.data!.lng as String),
                                          ),
                                          infoWindow: InfoWindow(
                                            title: 'จุดเกิดเหตุ',
                                          ),
                                        )
                                      },
                                    )),
                          const ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text('อุปกรณ์ที่ใช้'),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: FutureBuilder<List<ToolNonEmergencyModel>>(
                                future: getTool(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  return snapshot.hasData
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Text(
                                                '${index + 1}. ${snapshot.data![index].toolName}');
                                          },
                                        )
                                      : Center(
                                          child: CircularProgressIndicator());
                                }),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                  foregroundColor:
                                      WidgetStateProperty.all(Colors.black),
                                  backgroundColor:
                                      WidgetStateProperty.all(Colors.green),
                                ),
                                onPressed: () {
                                  int? case_id = snapshot.data!.id;
                                  String lat = snapshot.data!.lat.toString();
                                  String long = snapshot.data!.lng.toString();
                                  String case_type = 'non_emergency';
                                  confirm(case_id!, lat, long, case_type);
                                },
                                child: Text('ยืนยัน')),
                          )
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          )
        ]));
  }
}
