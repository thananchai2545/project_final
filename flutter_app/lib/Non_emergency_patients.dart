import 'package:flutter/material.dart';
import 'package:flutter_app/widget/textformfield.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class NonEmergencyPatients extends StatefulWidget {
  const NonEmergencyPatients({super.key});

  @override
  _NonEmergencyPatientsState createState() => _NonEmergencyPatientsState();
}

class _NonEmergencyPatientsState extends State<NonEmergencyPatients> {
  final _formKey = GlobalKey<FormState>();
  int selected_sex = 0;
  final TextEditingController age = TextEditingController();
  final TextEditingController name_lastname = TextEditingController();
  final TextEditingController id_card = TextEditingController();
  final TextEditingController tel = TextEditingController();

  void _nextHealth() {
    Map<String, dynamic> data = {
      'name_lastname': name_lastname.text,
      'age': age.text,
      'selected_sex': selected_sex,
      'id_card': id_card.text,
      'tel': tel.text
    };
    context.push('/non_emergency_patients/health', extra: data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          // textAlign: TextAlign.center,
          text: const TextSpan(
              text: "ผู้ป่วยฉุกเฉินไม่ฉุกเฉิน",
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nข้อมูลผู้ป่วย',
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
                  title: const Text('ชื่อ-นามสกุล'),
                  subtitle: TextFormField(
                    // controller: other_symptoms,
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
                  title: const Text('อายุ'),
                  subtitle: TextFormField(
                    controller: age,
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('เพศ'),
                  subtitle: Container(
                      height: 40,
                      padding: const EdgeInsets.all(2),
                      margin: const EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selected_sex = 1;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: selected_sex == 1
                                            ? Colors.white
                                            : Colors.grey,
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            topLeft: Radius.circular(5))),
                                    child: Text("ชาย",
                                        style: TextStyle(
                                            color: selected_sex == 1
                                                ? Colors.grey
                                                : Colors.white,
                                            fontSize: 17)),
                                  ))),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(color: Colors.white, width: 1)),
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selected_sex = 2;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: selected_sex == 2
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                    child: Text("หญิง",
                                        style: TextStyle(
                                            color: selected_sex == 2
                                                ? Colors.grey
                                                : Colors.white,
                                            fontSize: 17)),
                                  ))),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(color: Colors.white, width: 1)),
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selected_sex = 3;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: selected_sex == 3
                                            ? Colors.white
                                            : Colors.grey,
                                        borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(5),
                                            topRight: Radius.circular(5))),
                                    child: Text("ไม่ระบุ",
                                        style: TextStyle(
                                            color: selected_sex == 3
                                                ? Colors.grey
                                                : Colors.white,
                                            fontSize: 17)),
                                  ))),
                        ],
                      )),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('หมายเลขบัตรประชาชน'),
                  subtitle: TextFormField(
                    // controller: other_symptoms,
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
                  title: const Text('เบอร์โทรศัพท์'),
                  subtitle: TextFormField(
                    // controller: other_symptoms,
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
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
                      foregroundColor: WidgetStateProperty.all(Colors.black87),
                      minimumSize: WidgetStateProperty.all(const Size(150, 45)),
                      elevation: WidgetStateProperty.all(0),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: _nextHealth,
                    child: Text("ถัดไป"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
