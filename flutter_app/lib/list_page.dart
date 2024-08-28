// import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter_app/constant/config.dart';
import 'package:flutter_app/constant/token_manager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_app/model/case_model.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late Future<List<CaseModel>> futureData;

  @override
  void initState() {
    futureData = fetchCase();
    // futureData.then(() {});
    print(futureData);
    super.initState();
  }

  Future<List<CaseModel>> fetchCase() async {
    final token = await AuthService().loadToken();
    final memberId = await AuthService().loadMemberId();
    final response = await http.get(
      Uri.parse('${Config.API_URL}/api-app/case/$memberId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['case_data'];
      print(jsonResponse);
      return jsonResponse.map((data) => CaseModel.fromJson(data)).toList();
      // print(jsonDecode(response.body)['case_data'].length);
      // return await CaseModel.fromJson(
      //     jsonDecode(response.body)['case_data'][0] as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Center(
            child: FutureBuilder(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List? data = snapshot.data!;
              // return Text('${snapshot.data!.length}');
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.black12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ชื่อ - นามสกุล ${data[index].caseName}'),
                          Text('หมายเลขบัตรประชาชน ${data[index].caseIdcard}'),
                          Text('หมายเลขโทรศัพท์ ${data[index].caseTel}'),
                          data[index].caseType == 'accident'
                              ? Text('เคสที่แจ้ง อุบัติเหตุ')
                              : Text('หมายเหตุ ${data[index].caseType}'),
                          Text('สถานะ ${data[index].caseStatus}'),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              child: Text('ข้อมูลเพิ่มเติม'),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ]);
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        )),
      ),
    );
  }
}
