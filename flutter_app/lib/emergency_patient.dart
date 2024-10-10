import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class EmergencyPatient extends StatefulWidget {
  const EmergencyPatient({Key? key}) : super(key: key);

  @override
  _EmergencyPatientState createState() => _EmergencyPatientState();
}

class _EmergencyPatientState extends State<EmergencyPatient> {
  final _controller = TextEditingController();
  final List<String> entries = <String>[
    'อุบัติเหตุ',
    'โรคกำเริบ',
  ];

  final List<String> name = <String>[
    'accident',
    'exacerbation',
  ];
  // var reasonValidation = true;
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          // textAlign: TextAlign.center,
          text: const TextSpan(
            text: "ผู้ป่วยฉุกเฉิน",
            style: TextStyle(
              fontSize: 20,
              color: Colors.pink,
            ),
          ),
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
                      context.push('/emergencypatient/${name[index]}');
                      print('/${name[index]}');
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
                    child: Center(
                        child: Text(
                      '${entries[index]}',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ]);
            }),
      ),
    );
  }
}
