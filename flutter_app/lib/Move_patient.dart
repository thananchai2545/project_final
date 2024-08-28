import 'package:flutter/material.dart';
import 'package:flutter_app/select_patien.dart';

class MovePatient extends StatefulWidget {
  const MovePatient({Key? key}) : super(key: key);

  @override
  _MovePatientState createState() => _MovePatientState();
}

class _MovePatientState extends State<MovePatient> {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'ที่แคบ/ต่ำกว่า 2 เมตร',
      'ปานกลาง/มากกว่า 2 เมตร ไม่เกิน 4 เมตร',
      'กว้าง / มากว่า 4 เมตร'
    ];
    final List<Color> colorCodes = <Color>[
      Colors.red,
      Colors.orange,
      Colors.yellow
    ];
    final List<String> equipment = <String>[
      'เปลสนาม',
      'เตียงฉุกเฉินชนิดเปลี่ยนเก้าอี้ได้',
      'เตียงฉุกเฉิน'
    ];
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          // textAlign: TextAlign.center,
          text: const TextSpan(
              text: "เลือกวิธีการเคลื่อนย้าย",
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nเลือกวิธีเคลื่อนย้ายผู้ป่วย',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ]),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 665,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        alignment: Alignment.topCenter,
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectPatien()));
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
                        ))
                      ],
                    ),
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
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.bottomLeft,
                  child: Text('อุปกรณ์ : ${equipment[index]}'),
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
