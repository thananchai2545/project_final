import 'package:flutter/material.dart';
import 'package:flutter_app/Infectious_patients.dart';
import 'package:flutter_app/Non_emergency_patients.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_app/Special_patients.dart';
import 'package:flutter_app/accident.dart';
import 'package:flutter_app/emergency_patient.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final storage = new FlutterSecureStorage();

  final List<String> entries = <String>[
    'ผู้ป่วยฉุกเฉิน',
    'ผู้ป่วยไม่ฉุกเฉิน',
    'ผู้ป่วยสภาวะแพร่เชื้อ'
  ];

  final List<Color> colorCodes = <Color>[
    Colors.redAccent,
    Colors.greenAccent,
    Colors.purpleAccent
  ];
  final List<String> equipment = <String>[
    'อาการขั้นวิกฤติ',
    'นัดหมาย/เวลา',
    'ผู้ป่วยโรคติดต่อ'
  ];

  // final List<Widget> tab = <Widget>[
  //   const EmergencyPatient(),
  //   const SpecialPatients(),
  //   const NonEmergencyPatients(),
  //   // const InfectiousPatients()
  // ];

  final List<String> name = <String>[
    'emergencypatient',
    'non_emergency_patients',
    'infectiousPatients'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "หน้าหลัก",
          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
      ),
      body: Container(
        // color: Colors.grey,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Center(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () async {
                        context.push('/${name[index]}');
                        // print('/${name[index]}');
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(colorCodes[index]),
                          elevation: MaterialStateProperty.all(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          alignment: Alignment.centerLeft),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                              child: Text(
                            '${entries[index]}',
                            style: TextStyle(color: Colors.black, fontSize: 24),
                          )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'หมายเหตุ : ${equipment[index]}',
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ]);
              }),
        ),
      ),
    );
  }
}
