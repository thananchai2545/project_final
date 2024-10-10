import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfectiousPatientsDiagnose extends StatefulWidget {
  final Map<String, dynamic> data;
  const InfectiousPatientsDiagnose({Key? key, required this.data})
      : super(key: key);

  @override
  _InfectiousPatientsDiagnoseState createState() =>
      _InfectiousPatientsDiagnoseState();
}

class _InfectiousPatientsDiagnoseState
    extends State<InfectiousPatientsDiagnose> {
  final _formKey = GlobalKey();
  TextEditingController name_disease = TextEditingController();
  TextEditingController symptom = TextEditingController();
  TextEditingController period = TextEditingController();
  Map<String, dynamic> data = {};
  @override
  void initState() {
    data = widget.data;
    print(data);
    super.initState();
  }

  void _nextTravel() {
    data.addAll({
      'name_disease': name_disease.text,
      'symptom': symptom.text,
      'period': period.text
    });
    // print(data);
    context.push('/infectiousPatients/map/diagnose/travel', extra: data);
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
                  text: '\nการวินิจฉัยโรค',
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
                    title: const Text('ชื่อของโรคหรือสภาวะการติดเชื้อ'),
                    subtitle: TextFormField(
                      controller: name_disease,
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
                    title: const Text('อาการของโรค'),
                    subtitle: TextFormField(
                      controller: symptom,
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
                    title: const Text('ระยะเวลาของการติดเชื้อ'),
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
                  const ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('คำแนะนำสำหรับการป้องกันการแพร่เชื้อ'),
                      subtitle: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(' - ล้างมือบ่อยๆ'),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(' - สวมหน้ากากอนามัย'),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(' - รักษาระยะห่างทางสังคม'),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(' - งดการอยู่ในพื้นที่แออัด'),
                          )
                        ],
                      )),
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
                        onPressed: _nextTravel),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
