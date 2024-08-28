import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Move_patient.dart';
import 'package:flutter_app/map_patien.dart';
// import 'package:flutter_app/test.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({Key? key}) : super(key: key);

  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  final List<String> list = <String>[
    'ที่แคบ/ต่ำกว่า 2 เมตร',
    'ปานกลาง/มากกว่า 2 เมตร ไม่เกิน 4 เมตร',
    'กว้าง / มากว่า 4 เมตร'
  ];
  String dropdownValue = 'ที่แคบ/ต่ำกว่า 2 เมตร';
  final List<String> list2 = <String>[
    'ผู้ป่วยที่บอกอาการได้ไม่แน่ชัด',
    'ผู้ป่วยที่สามารถระบุอุปกรณ์ที่ต้องการได้',
    'ผู้ป่วยที่ประสบณ์อุบัติเหตุ'
  ];
  String dropdownValue2 = 'ผู้ป่วยที่บอกอาการได้ไม่แน่ชัด';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          // resizeToAvoidBottomInset: Null,
          appBar: AppBar(
            title: RichText(
              // textAlign: TextAlign.center,
              text: const TextSpan(
                  text: "รายละเอียดของผู้ป่วย",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.pink,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nแสดงรายละเอียดของผู้ป่วย',
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ]),
            ),
            backgroundColor: Colors.grey,
          ),
          body: Container(
              color: const Color.fromARGB(255, 211, 211, 211),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 45, // Set the desired height here
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 145, 145, 145),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            hintText: 'ชื่อ - นามสกุล',
                            contentPadding: EdgeInsets.all(10)),
                      ),
                    ),

                    SizedBox(height: 10),
                    Container(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 145, 145, 145),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            hintText: 'เลขบัตรประชาชน 13 หลัก',
                            contentPadding: EdgeInsets.all(10)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 145, 145, 145),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 30),
                            child: DropdownButton(
                              // initialSelection: list.first,
                              value: dropdownValue,
                              items: list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              isExpanded:
                                  true, //make true to take width of parent widget
                              underline: Container(), //empty line
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black45,
                              ),
                              dropdownColor: Color.fromARGB(255, 145, 145, 145),
                              borderRadius: BorderRadius.circular(10),
                              iconEnabledColor: Colors.black45, //Icon color
                            ))),
                    SizedBox(
                      height: 10,
                    ),
                    DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 145, 145, 145),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 30),
                            child: DropdownButton(
                              // initialSelection: list.first,
                              value: dropdownValue2,
                              items: list2.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownValue2 = value!;
                                });
                              },
                              isExpanded:
                                  true, //make true to take width of parent widget
                              underline: Container(), //empty line
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black45,
                              ),
                              dropdownColor: Color.fromARGB(255, 145, 145, 145),
                              borderRadius: BorderRadius.circular(10),
                              iconEnabledColor: Colors.black45, //Icon color
                            ))),
                    SizedBox(height: 10),

                    Container(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 145, 145, 145),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            hintText: 'อาการแพ้ยา',
                            contentPadding: EdgeInsets.all(10)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 145, 145, 145),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            hintText: 'โรคประจำตัว',
                            contentPadding: EdgeInsets.all(10)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 145, 145, 145),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            hintText: 'เบอร์โทรศัพท์(ผู้แจ้ง)',
                            contentPadding: EdgeInsets.all(10)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 145, 145, 145),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            hintText: 'เบอร์โทรศัพท์(ผู้ป่วย)',
                            contentPadding: EdgeInsets.all(10)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 20, 90),
                      child: Text(
                        'กรุณากรอกข้อมูลเหล่านี้หากทราบหรือรู้จักจักกับผู้ป่วยถ้าไม่ใส่เฉพาะข้อมูลที่ทราบ และสามารถกดถัดไปเพื่อไปหน้าเครื่อนย้ายได้',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    // SizedBox(height: 10),
                  ],
                ),
              )),

          // bottomSheet: Container(
          // padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          // color: Colors.blue,
          // child: const SizedBox(
          //   width: double.infinity,
          //   height: 20,
          //   child: Text("Above Keyboard"),
          // )),
          bottomSheet: Container(
            // padding: MediaQuery.of(context).viewInsets,
            color: Colors.white,
            height: 70,
            // width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MapPatien()));
                      // Navigator.pushNamed(context, 'page_detail');
                    },
                    child: Text(
                      "ถัดไป",
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff32303b)),
                      foregroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                      minimumSize: MaterialStateProperty.all(Size(150, 45)),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
      // bottomNavigationBar:
    );
  }
}
