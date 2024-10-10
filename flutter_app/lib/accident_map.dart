import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class AccidentMap extends StatefulWidget {
  // late AccidentModel? accidentModel;
  final List data_patient;

  const AccidentMap({super.key, required this.data_patient});

  @override
  _AccidentMapState createState() => _AccidentMapState();
}

class _AccidentMapState extends State<AccidentMap> {
  final TextEditingController _landmarkController = TextEditingController();
  void accident_contact() {
    List dataPatient = widget.data_patient;
    dataPatient[0]['case_landmark'] = _landmarkController.text;
    // // Map<String, dynamic> user = jsonDecode(data);
    // print(data);
    // widget.data.
    // AccidentData;
    // print(widget.accidentData.number_patients);
    context.push('/emergencypatient/accident/accident_map/accident_contact',
        extra: dataPatient);
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const ListTile(
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
                title: const Text('จุดสังเกตุ'),
                subtitle: TextFormField(
                  controller: _landmarkController,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.green.shade600),
                    foregroundColor: WidgetStateProperty.all(Colors.black87),
                    minimumSize: WidgetStateProperty.all(const Size(150, 45)),
                    elevation: WidgetStateProperty.all(0),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: accident_contact,
                  child: Text("ถัดไป"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
