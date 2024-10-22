import 'dart:convert';

import 'package:ambulance/constant/config.dart';
import 'package:ambulance/constant/token_maneger.dart';
import 'package:ambulance/map_page.dart';
import 'package:ambulance/model/ambulance_model.dart';
import 'package:ambulance/model/case.dart';
import 'package:ambulance/model/time_ago.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:get_time_ago/get_time_ago.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool status = false;
  late Future<List<Case>> futureCase;
  late Future<AmbulanceModel> futureAmbulance;

  @override
  initState() {
    futureAmbulance = getAmbulance();
    futureCase = getCase();
    super.initState();
  }

  Future<AmbulanceModel> getAmbulance() async {
    final token = await AuthService().getToken();
    final id = await AuthService().getId();
    final response = await http.get(
        Uri.parse(
            '${Config.API_URL}/api-ambulance/ambulance/get_ambulance/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'bearer $token',
        });
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['ambulance'][0]['status'] == 'true') {
        setState(() {
          status = true;
        });
      } else {
        setState(() {
          status = false;
        });
      }
      return AmbulanceModel.fromJson(jsonDecode(response.body)['ambulance'][0]);
    } else {
      return throw Exception('Failed to load data');
    }
  }

  Future<List<Case>> getCase() async {
    final token = await AuthService().getToken();
    final id = await AuthService().getId();
    print(token);
    final response = await http.get(
        Uri.parse('${Config.API_URL}/api-ambulance/ambulance/get_case/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'bearer $token',
        });

    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body)['data'];

      List map = await data.map((e) => e).toList();

      return map.map((json) => Case.fromJson(json)).toList();
    } else {
      return throw Exception('Failed to load data');
    }
  }

  Future<void> update_status(bool status) async {
    // print(status);
    final token = await AuthService().getToken();
    final id = await AuthService().getId();
    try {
      final response = await http.post(
          Uri.parse('${Config.API_URL}/api-ambulance/ambulance/status'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'bearer $token',
          },
          body: jsonEncode({"id": id.toString(), "status": status.toString()}));
      if (response.statusCode == 200) {
        print('Server updated successfully');
      } else {
        print('Failed to update server: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error updating server: $error');
    }
  }

  void _logOut() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ยืนยันการออกจากระบบ'),
          content: Text('คุณต้องการออกจากระบบหรือไม่?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () async {
                await AuthService().clearToken();
                context.go('/login');
              },
              child: Text('ยืนยัน', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureAmbulance,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.hasData
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.grey,
                  centerTitle: true,
                  title: ListTile(
                    title: SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: status ? Text('on') : Text('off'),
                      value: status,
                      onChanged: (newState) {
                        setState(() {
                          status = newState;
                        });
                        update_status(status);
                      },
                    ),
                  ),
                  leadingWidth: 100,
                  leading: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: SizedBox(
                      child: Center(
                        child: Text('${snapshot.data.ambulanceRegistration}'),
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: IconButton(
                          onPressed: _logOut, icon: const Icon(Icons.logout)),
                    ),
                  ],
                ),
                body: Stack(children: [
                  snapshot.data.caseLat == null ||
                          snapshot.data.caseLat == 'null'
                      ? Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height,
                          child: FutureBuilder<List<Case>>(
                            future: futureCase,
                            builder: (context, snapshot) {
                              List<Case>? data = snapshot.data;
                              return snapshot.hasData
                                  ? snapshot.data!.length > 0
                                      ? ListView.builder(
                                          padding: const EdgeInsets.all(8),
                                          itemCount: data?.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return SingleChildScrollView(
                                              child: Container(
                                                height: 80,
                                                margin:
                                                    EdgeInsets.only(bottom: 20),
                                                child: ElevatedButton(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white24),
                                                        height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            3.7,
                                                        child: Center(
                                                            child: Center(
                                                          child: Text(StringExtension
                                                              .displayTimeAgoFromTimestamp(
                                                                  data![index]
                                                                      .dateReceive
                                                                      .toString())),
                                                        )),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white24),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            3.5,
                                                        height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height,
                                                        child:
                                                            Column(children: [
                                                          SizedBox(height: 10),
                                                          Text('ประเภท'),
                                                          SizedBox(height: 10),
                                                          data![index].type ==
                                                                  'exacerbation'
                                                              ? Text(
                                                                  'โรคกำเริบ')
                                                              : data![index]
                                                                          .type ==
                                                                      'non_emergency'
                                                                  ? Text(
                                                                      'ผู้ป่วยปกติ')
                                                                  : data![index]
                                                                              .type ==
                                                                          'infectious'
                                                                      ? Text(
                                                                          'โรคติดต่อ')
                                                                      : Text(
                                                                          'อุบัติเหตุ'),
                                                        ]),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white24),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            3.5,
                                                        height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height,
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                                height: 10),
                                                            Text('รายละเอียด'),
                                                            SizedBox(
                                                                height: 10),
                                                            Text(data[index]
                                                                .tel
                                                                .toString()),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  style: ButtonStyle(
                                                    foregroundColor:
                                                        WidgetStateProperty.all(
                                                      Colors.black,
                                                    ),
                                                    backgroundColor:
                                                        WidgetStateProperty.all(
                                                      Colors.white24,
                                                    ),
                                                    padding:
                                                        MaterialStateProperty
                                                            .all<EdgeInsets>(
                                                                EdgeInsets.all(
                                                                    0)),
                                                    shape:
                                                        WidgetStateProperty.all(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    context.push(
                                                        '/${data[index].type}_detail/${data[index].id}',
                                                        extra: data[index].id);
                                                  },
                                                ),
                                              ),
                                            );
                                          })
                                      : RefreshIndicator(
                                          onRefresh: () async {
                                            await getCase();
                                            context.push('/');
                                          },
                                          child: Stack(children: [
                                            ListView(children: const [
                                              Text(
                                                'ยังไม่ข้อมูลการแจ้งเหตุในขณะนี้',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ]),
                                          ]),
                                        )
                                  : const Center(
                                      child: CircularProgressIndicator());
                            },
                          ))
                      : MapPage(),
                  SingleChildScrollView()
                ]),
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
