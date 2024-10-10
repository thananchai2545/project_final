import 'package:flutter/material.dart';

class SemiEmergency extends StatefulWidget {
  const SemiEmergency({super.key});

  @override
  _SemiEmergencyState createState() => _SemiEmergencyState();
}

class _SemiEmergencyState extends State<SemiEmergency> {
  final _formKey = GlobalKey();
  int selected_breathe = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          // textAlign: TextAlign.center,
          text: const TextSpan(
              text: "ผู้ป่วยฉุกเฉินกึ่งฉุกเฉิน",
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nไม่ถึงขั้นวิกฤติ สามารถวินิจฉัยได้',
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
                                      selected_breathe = 1;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: selected_breathe == 1
                                            ? Colors.white
                                            : Colors.grey,
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            topLeft: Radius.circular(5))),
                                    child: Text("ชาย",
                                        style: TextStyle(
                                            color: selected_breathe == 1
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
                                      selected_breathe = 2;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: selected_breathe == 2
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                    child: Text("หญิง",
                                        style: TextStyle(
                                            color: selected_breathe == 2
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
                                      selected_breathe = 3;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: selected_breathe == 3
                                            ? Colors.white
                                            : Colors.grey,
                                        borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(5),
                                            topRight: Radius.circular(5))),
                                    child: Text("ไม่ระบุ",
                                        style: TextStyle(
                                            color: selected_breathe == 3
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
                        foregroundColor:
                            WidgetStateProperty.all(Colors.black87),
                        minimumSize:
                            WidgetStateProperty.all(const Size(150, 45)),
                        elevation: WidgetStateProperty.all(0),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      onPressed: () => print('adad'),
                      child: Text("ถัดไป")
                      // context.push('/non_emergency_patients/appointment'),
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
