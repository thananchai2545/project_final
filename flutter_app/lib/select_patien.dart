import 'package:flutter/material.dart';
import 'package:flutter_app/Special_patients.dart';
import 'package:flutter_app/emerge.dart';
import 'package:flutter_app/emergency_patient.dart';
import 'package:flutter_app/map_patien.dart';

class SelectPatien extends StatefulWidget {
  const SelectPatien({Key? key}) : super(key: key);

  @override
  _SelectPatienState createState() => _SelectPatienState();
}

class _SelectPatienState extends State<SelectPatien> {
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

  final List<Widget> tab = <Widget>[
    EmergencyPatient(),
    SpecialPatients(),
    MapPatien()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          // textAlign: TextAlign.center,
          text: const TextSpan(
              text: "เลือกประเภทผู้ป่วย",
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nเลือกประเภทของผู้ป่วย',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ]),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        // color: Colors.grey,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      color: Colors.amber,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => tab[index]));
                          // Navigator.pushNamed(context, 'page_detail');
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                  color: colorCodes[index]),
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
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff32303b)),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            alignment: Alignment.centerLeft),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.bottomLeft,
                      child: Text('หมายเหตุ : ${equipment[index]}'),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ]);
            }),
      ),
    );
  }
}
