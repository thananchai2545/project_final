import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class AccidentMap extends StatefulWidget {
  // late AccidentModel? accidentModel;
  final List data_patient;

  const AccidentMap({Key? key, required this.data_patient}) : super(key: key);

  @override
  _AccidentMapState createState() => _AccidentMapState();
}

class _AccidentMapState extends State<AccidentMap> {
  final TextEditingController _landmarkController = TextEditingController();
  void accident_contact() {
    List data_patient = widget.data_patient;
    data_patient[0]['case_landmark'] = _landmarkController.text;
    // // Map<String, dynamic> user = jsonDecode(data);
    // print(data);
    // widget.data.
    // AccidentData;
    // print(widget.accidentData.number_patients);
    context.push('/accident/accident_map/accident_contact',
        extra: data_patient);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
              text: "อุบัติเหตุ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nเลือกที่อยู่ของผู้ป่วย',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ]),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('ตำแหน่งที่เกิดเหตุ'),
              // subtitle:
              // TextFormField(
              //   // controller: _passwordController,
              //   style: TextStyle(color: Colors.black),
              //   keyboardType: TextInputType.text,
              //   decoration: InputDecoration(
              //       filled: true,
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(5))),
              // ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('จุดสังเกตุ'),
              subtitle: TextFormField(
                controller: _landmarkController,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                child: Text("ถัดไป"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green.shade600),
                  foregroundColor: MaterialStateProperty.all(Colors.black87),
                  minimumSize: MaterialStateProperty.all(Size(150, 45)),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: accident_contact,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
