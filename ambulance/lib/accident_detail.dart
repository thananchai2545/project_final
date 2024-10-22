import 'dart:convert';

import 'package:ambulance/constant/config.dart';
import 'package:ambulance/constant/token_maneger.dart';
import 'package:ambulance/model/accident_model.dart';
import 'package:ambulance/model/case_image_model.dart';
import 'package:ambulance/model/case_symptom_model.dart';
import 'package:ambulance/model/tool_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Accident extends StatefulWidget {
  final String id;
  const Accident({Key? key, required this.id}) : super(key: key);

  @override
  _AccidentState createState() => _AccidentState();
}

class _AccidentState extends State<Accident> {
  late String id;
  late Future<List<ToolModel>> tool;
  bool _loading = true;
  late LatLng _currentPosition;

  @override
  void initState() {
    _getCurrentLocation();
    id = widget.id;
    data();
    tool = getTool();
    getSymptom();
    getImage();
    super.initState();
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

  Future<AccidentModel> data() async {
    final token = await AuthService().getToken();
    // print(token);
    var response = await http.get(
        Uri.parse('${Config.API_URL}/api-ambulance/accident/get_case/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'bearer ${token}',
        });
    if (response.statusCode == 200) {
      return AccidentModel.fromJson(jsonDecode(response.body)['data'][0]);
    } else {
      return throw Exception('Failed to load data');
    }
  }

  Future<List<CaseSymptomModel>> getSymptom() async {
    final token = await AuthService().getToken();
    // final caseId = widget.id;
    var response = await http.post(
        Uri.parse('${Config.API_URL}/api-ambulance/accident/get_symptom'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'bearer ${token}',
        },
        body: jsonEncode({'case_id': id}));
    if (response.statusCode == 200) {
      return List<CaseSymptomModel>.from(jsonDecode(response.body)['data']
          .map((x) => CaseSymptomModel.fromJson(x)));
    } else {
      return throw Exception('Failed to load data');
    }
  }

  Future<List<CaseImageModel>> getImage() async {
    final token = await AuthService().getToken();
    print(token);
    var response = await http.post(
        Uri.parse('${Config.API_URL}/api-ambulance/accident/get_image'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'bearer ${token}',
        },
        body: jsonEncode({'case_id': id}));
    if (response.statusCode == 200) {
      return List<CaseImageModel>.from(jsonDecode(response.body)['data']
          .map((x) => CaseImageModel.fromJson(x)));
    } else {
      return throw Exception('Failed to load data');
    }
  }

  void confirm(int case_id, String lat, String lng, String case_type) async {
    final token = await AuthService().getToken();
    final id = await AuthService().getId();
    print('$id, $case_id, $lat, $lng, $case_type');
    var response = await http.post(
      Uri.parse('${Config.API_URL}/api-ambulance/accident/confirm'),
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

  Future<List<ToolModel>> getTool() async {
    final token = await AuthService().getToken();
    // final id = await AuthService().getId();
    var response = await http.post(
      Uri.parse(
          '${Config.API_URL}/api-ambulance/accident/get_tool/${widget.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List data = await jsonDecode(response.body)['tool'].toList();
      return data.map((json) => ToolModel.fromJson(json)).toList();
    } else {
      return throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายละเอียด'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<AccidentModel>(
              future: data(),
              builder: (context, snapshot) {
                print(snapshot.hasData);
                return snapshot.hasData
                    ? ListView(children: [
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
                                            '${snapshot.data!.caseTel}', // your number
                                      );
                                      if (await canLaunchUrl(_teleLaunchUri)) {
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
                                snapshot.data!.caseBreathing == 'breathe'
                                    ? Text(
                                        'การหายใจ : หายใจ',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    : snapshot.data!.caseBreathing ==
                                            'not_breathing'
                                        ? Text(
                                            'การหายใจ : ไม่หายใจ',
                                            style: TextStyle(fontSize: 16),
                                          )
                                        : Text(
                                            'การหายใจ : ไม่แน่ใจ',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey[300],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'อาการเบื้องต้น :    ',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FutureBuilder(
                                      future: getSymptom(),
                                      builder: (context, snapshot) {
                                        return snapshot.hasData
                                            ? ListView.builder(
                                                shrinkWrap: true,
                                                itemCount:
                                                    snapshot.data?.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Text(
                                                    '${index + 1}. ${snapshot.data![index].symptomName}',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  );
                                                },
                                              )
                                            : const Center(
                                                child:
                                                    CircularProgressIndicator());
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey[300],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'อาการอื่นๆ เพิ่มเติม : ',
                                  style: TextStyle(fontSize: 16),
                                ),
                                snapshot.data?.caseOtherSymptom == ''
                                    ? Text(
                                        'ไม่ระบุ',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    : Text(
                                        '${snapshot.data?.caseOtherSymptom}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey[300],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    'รูปภาพประกอบ',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  subtitle: FutureBuilder(
                                    future: getImage(),
                                    builder: (context, snapshot) {
                                      return snapshot.hasData
                                          ? GridView.builder(
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                              ),
                                              shrinkWrap: true,
                                              itemCount: snapshot.data?.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image(
                                                          width: 100,
                                                          height: 100,
                                                          image: NetworkImage(
                                                              '${Config.API_URL}/${snapshot.data![index].caseImagePath}'),
                                                        ),
                                                      )
                                                    ]);
                                              },
                                            )
                                          : Center(
                                              child:
                                                  CircularProgressIndicator());
                                    },
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey[300],
                                ),
                                ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: Text(
                                      'เจ้าหน้าที่รับเคส : ${snapshot.data?.userName} ${snapshot.data?.userLastname}',
                                      style: TextStyle(fontSize: 15),
                                    ))
                              ]),
                        ),
                        const ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text('ข้อมูลผู้ติดต่อ'),
                        ),
                        Container(
                          // margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Text(
                                  'ชื่อ - นามสกุล : ${snapshot.data?.caseName}',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: Colors.grey[300],
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Text(
                                  'เบอร์โทรศัพท์ : ${snapshot.data?.caseTel} ',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: _loading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : GoogleMap(
                                  myLocationEnabled: true,
                                  initialCameraPosition: CameraPosition(
                                      target: LatLng(_currentPosition.latitude,
                                          _currentPosition.longitude),
                                      zoom: 14),
                                  markers: {
                                    Marker(
                                      markerId: MarkerId('id-1'),
                                      position: LatLng(
                                        double.parse(
                                            snapshot.data!.caseLat as String),
                                        double.parse(
                                            snapshot.data!.caseLng as String),
                                      ),
                                      infoWindow: InfoWindow(
                                        title: 'จุดเกิดเหตุ',
                                      ),
                                    )
                                  },
                                ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'อุปกรณ์ที่ใช้',
                                style: TextStyle(fontSize: 16),
                              ),
                              FutureBuilder(
                                future: tool,
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<ToolModel>> snapshot) {
                                  return snapshot.hasData
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (context, index) {
                                            return Text(
                                              '${index + 1}. ${snapshot.data![index].toolName}',
                                              style: TextStyle(fontSize: 16),
                                            );
                                          },
                                        )
                                      : const Center(
                                          child: CircularProgressIndicator());
                                },
                              )
                            ],
                          ),
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
                                String lat = snapshot.data!.caseLat.toString();
                                String long = snapshot.data!.caseLng.toString();
                                // String case_status = 'departure';
                                String case_type = 'accident';
                                confirm(case_id!, lat, long, case_type);
                              },
                              child: Text('ยืนยัน')),
                        )
                      ])
                    : const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          const SingleChildScrollView()
        ],
      ),
    );
  }
}
