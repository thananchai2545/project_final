import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/config.dart';
import 'package:flutter_app/constant/token_manager.dart';
import 'package:flutter_app/model/hospital_model.dart';
import 'package:flutter_app/widget/_DatePickerItem.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class InfectiousPatientsTravel extends StatefulWidget {
  final Map<String, dynamic> data;
  const InfectiousPatientsTravel({super.key, required this.data});

  @override
  _InfectiousPatientsTravelState createState() =>
      _InfectiousPatientsTravelState();
}

class _InfectiousPatientsTravelState extends State<InfectiousPatientsTravel> {
  final _formKey = GlobalKey();
  TextEditingController _dateController = TextEditingController();
  DateTime time = DateTime.now();
  String hospital_id = '';
  Map<String, dynamic> data = {};
  late Future<List<Hospital>> futureHospital;
  @override
  void initState() {
    data = widget.data;
    futureHospital = readHospital();
    super.initState();
  }

  void _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      setState(() {
        _dateController.text = formattedDate;
      });
    } else {
      print("Date is not selected");
    }
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  Future<void> _report() async {
    final token = await AuthService().loadToken();
    print(_dateController.text);
    try {
      var request = http.post(
          Uri.parse('${Config.API_URL}/api-app/infectious/create'),
          headers: {
            "Authorization": 'bearer $token',
          },
          body: {
            'name_lastname': data['name_lastname'],
            'age': data['age'],
            'id_card': data['id_card'],
            'sex': data['sex'],
            'tel': data['tel'],
            'address': data['address'],
            'landmark': data['landmark'],
            'name_disease': data['name_disease'],
            'symptom': data['symptom'],
            'period': data['period'],
            'date_service': _dateController.text,
            'time_service': DateFormat('kk:mm').format(time),
            'hospital_id': hospital_id
          }).then((response) {
        if (response.statusCode == 200) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text(
                'แจ้งเหตุเสร็จสิ้น',
                style: TextStyle(fontSize: 18),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => context.push('/'),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");
      });
    } catch (e) {}
  }

  Future<List<Hospital>> readHospital() async {
    try {
      final token = await AuthService().loadToken();
      var response = await http.get(
        Uri.parse('${Config.API_URL}/api-app/hospital/index'),
        headers: {
          'Authorization': 'Bearer $token', // Include the token in the headers
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        List data = await jsonDecode(response.body);
        // print(jsonDecode(response.body));
        return data.map((json) => Hospital.fromJson(json)).toList();
        // return Hospital.fromJson(jsonDecode(response.body)[0]);
      } else {
        // If the server does not return a 200 OK response, throw an error
        throw Exception('Failed to load hospital');
      }
    } catch (e) {
      throw Exception('Failed to load hospital2');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          // textAlign: TextAlign.center,
          text: const TextSpan(
              text: "ผู้ป่วยสภาวะแพร่เชื้อ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nข้อมูลการเดินทาง',
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
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('วันที่ที่ต้องการใช้บริการ'),
                    subtitle: TextFormField(
                      keyboardType: TextInputType.none,
                      readOnly: true,
                      controller: _dateController,
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.calendar_today),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onTap: _selectDate,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'โปรดเลือกวันเกิด';
                        }
                        return null;
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('เวลาที่ต้องการใช้บริการ'),
                    subtitle: DatePickerItem(
                      children: <Widget>[
                        const Text('เวลา'),
                        CupertinoButton(
                          // Display a CupertinoDatePicker in time picker mode.
                          onPressed: () => _showDialog(
                            CupertinoDatePicker(
                              initialDateTime: time,
                              mode: CupertinoDatePickerMode.time,
                              use24hFormat: true,
                              // This is called when the user changes the time.
                              onDateTimeChanged: (DateTime newTime) {
                                setState(() => time = newTime);
                                print(newTime);
                              },
                            ),
                          ),
                          // In this example, the time value is formatted manually.
                          // You can use the intl package to format the value based on
                          // the user's locale settings.
                          child: Text(
                            '${time.hour}:${time.minute}',
                            style: const TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('เลือกโรงพยาบาล'),
                      subtitle: FutureBuilder<List<Hospital>>(
                          future: futureHospital,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            return snapshot.hasData
                                ? DropdownButtonFormField<String>(
                                    icon: const Icon(Icons.arrow_downward),
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(color: Colors.amber),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    hint: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('เลือกโรงพยาบาล'),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        hospital_id = value!;
                                      });
                                    },
                                    items: snapshot.data
                                        .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value.id.toString(),
                                        child:
                                            Text(value.hospitalName.toString()),
                                      );
                                    }).toList(),
                                  )
                                : Container(
                                    child: Center(
                                      child: Text('Loading...'),
                                    ),
                                  );
                          })),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      child: Text("แจ้งเหตุ"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red.shade400),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black87),
                        minimumSize: MaterialStateProperty.all(Size(150, 45)),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      onPressed: _report,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
