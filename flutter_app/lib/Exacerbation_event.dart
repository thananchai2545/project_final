import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExacerbationEvent extends StatefulWidget {
  final Map<String, dynamic> data;
  const ExacerbationEvent({super.key, required this.data});

  @override
  _ExacerbationEventState createState() => _ExacerbationEventState();
}

class _ExacerbationEventState extends State<ExacerbationEvent> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController date_incident = TextEditingController();
  // TextEditingController time = TextEditingController();
  TextEditingController location_incident = TextEditingController();
  TextEditingController symptom = TextEditingController();
  TextEditingController period = TextEditingController();
  TextEditingController assistance = TextEditingController();
  Map<String, dynamic>? data = {};
  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  void _nextMap() {
    data?.addAll({
      'date_incident': date_incident.text,
      'location_incident': location_incident.text,
      'symptom': symptom.text,
      'period': period.text,
      'assistance': assistance.text
    });
    context.push('/emergencypatient/exacerbation/event/map', extra: data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          // textAlign: TextAlign.center,
          text: const TextSpan(
              text: "โรคกำเริบ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nข้อมูลเหตุการณ์กำเริบ',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ]),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('วันที่และเวลาที่เกิดเหตุการณ์'),
                    subtitle: TextFormField(
                      controller: date_incident,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('สถานที่ที่เกิดเหตุ'),
                    subtitle: TextFormField(
                      controller: location_incident,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'เช่น บ้าน, ที่ทำงาน, นอกสถานที่',
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('ลักษณะอาการที่กำเริบ'),
                    subtitle: TextFormField(
                      controller: symptom,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'เช่น หายใจไม่ออก, หมดสติ, ชัก, เจ็บหน้าอก',
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('ระยะเวลาที่อาการกำเริบเริ่มต้น'),
                    subtitle: TextFormField(
                      controller: period,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('การดำเนินการช่วยเหลือเบื้องต้น'),
                    subtitle: TextFormField(
                      controller: assistance,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'เช่น ให้ยา, ปฐมพยาบาล',
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
                          foregroundColor:
                              WidgetStateProperty.all(Colors.black87),
                          minimumSize:
                              WidgetStateProperty.all(const Size(150, 45)),
                          elevation: WidgetStateProperty.all(0),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: _nextMap,
                        child: Text("ถัดไป")),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
