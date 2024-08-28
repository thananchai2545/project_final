import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_app/Special_patients.dart';
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
    'ผู้ป่วยฉุกเฉิน(สำหรับผู้ป่วยที่ไม่ทราบอาการแน่ชัด)',
    'ผู้ป่วยพิเศษ / ผู้สูงอายุ',
    'อุบัติเหตุ'
  ];

  final List<Color> colorCodes = <Color>[
    Colors.red,
    Colors.orange,
    Colors.yellow
  ];
  final List<String> equipment = <String>[
    'สำหรับผู้ป่วยที่บอกอาการได้ไม่แน่ชัด',
    'สำหรับบุคคลที่สามารถระบุอุปกรณ์ที่ต้องการได้',
    'สำหรับผู้ป่วยที่ประสบณ์อุบัติเหตุ'
  ];

  final List<IconData> icon = <IconData>[
    FontAwesomeIcons.truckMedical,
    FontAwesomeIcons.houseMedical,
    FontAwesomeIcons.carOn
  ];

  final List<Widget> tab = <Widget>[
    const EmergencyPatient(),
    const SpecialPatients(),
    const Accident()
  ];

  final List<String> name = <String>[
    'emergencypatient',
    'specialpatients',
    'accident',
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
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff32303b)),
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
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                color: colorCodes[index]),
                            child: Icon(icon[index]),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                              child: Text(
                            '${entries[index]}',
                            style: TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.bottomLeft,
                    child: Text('หมายเหตุ : ${equipment[index]}'),
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
