import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfectiousPatientsMap extends StatefulWidget {
  final Map<String, dynamic> data;

  const InfectiousPatientsMap({super.key, required this.data});

  @override
  _InfectiousPatientsMapState createState() => _InfectiousPatientsMapState();
}

class _InfectiousPatientsMapState extends State<InfectiousPatientsMap> {
  final _formKey = GlobalKey();
  TextEditingController address = TextEditingController();
  TextEditingController landmark = TextEditingController();
  Map<String, dynamic> data = {};

  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  void _nextDiagnose() {
    data.addAll({'address': address.text, 'landmark': landmark.text});
    // print(data);
    context.push('/infectiousPatients/map/diagnose', extra: data);
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
                  text: '\nที่อยู่ของผู้ป่วย',
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
                    title: Text('ที่อยู่ของผู้ป่วย'),
                    subtitle: TextFormField(
                      controller: address,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('จุดสังเกต'),
                    subtitle: TextFormField(
                      controller: landmark,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  ListTile(
                    title: Text('Google map'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        child: Text("ถัดไป"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green.shade600),
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
                        onPressed: _nextDiagnose),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
