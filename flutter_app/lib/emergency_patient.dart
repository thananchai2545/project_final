import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPatient extends StatefulWidget {
  const EmergencyPatient({Key? key}) : super(key: key);

  @override
  _EmergencyPatientState createState() => _EmergencyPatientState();
}

class _EmergencyPatientState extends State<EmergencyPatient> {
  final _controller = TextEditingController();
  // var reasonValidation = true;
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: RichText(
              // textAlign: TextAlign.center,
              text: const TextSpan(
                  text: "ผู้ป่วยฉุกเฉิน",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.pink,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nอาการ / โรคที่เป็น',
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ]),
            ),
            backgroundColor: Colors.grey,
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back),
            //   onPressed: () {
            //     context.pop();
            //   },
            // ),
          ),
          body: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.pink),
              child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              width: 45,
                              height: 45,
                              child: FaIcon(FontAwesomeIcons.user)),
                          title: Text('ListTile with  background'),
                          subtitle: Text('asdasdas'),
                          // tileColor: Colors.red,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(65, 0, 0, 0),
                          child: TextFormField(
                              minLines: 10,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                  filled: true,
                                  // fillColor: Colors.grey,
                                  alignLabelWithHint: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ))),
                        ),
                      ],
                    )),
              )),
          bottomNavigationBar: Container(
              width: MediaQuery.of(context).size.width / 1.05,
              height: 70,
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => MovePatient()));
                  // Navigator.pushNamed(context, 'page_detail');
                },
                child: Text(
                  "ถัดไป",
                  style: TextStyle(fontSize: 18),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff32303b)),
                  foregroundColor: MaterialStateProperty.all(Colors.redAccent),
                  // minimumSize: MaterialStateProperty.all(Size(150, 45)),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              )),
        ));
  }
}
