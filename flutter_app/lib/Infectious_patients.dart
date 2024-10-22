import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfectiousPatients extends StatefulWidget {
  const InfectiousPatients({Key? key}) : super(key: key);

  @override
  _InfectiousPatientsState createState() => _InfectiousPatientsState();
}

class _InfectiousPatientsState extends State<InfectiousPatients> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name_lastname = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController id_card = TextEditingController();
  int _sex = 0;
  TextEditingController _tel = TextEditingController();
  void _nextMap() {
    if (_formKey.currentState!.validate()) {
      if (_sex == 0) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text(
              'กรุณาระบุเพศ',
              style: TextStyle(fontSize: 18),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        Map<String, dynamic> data = {
          'name_lastname': name_lastname.text,
          'age': _age.text,
          'id_card': id_card.text,
          'sex': _sex,
          'tel': _tel.text,
        };
        context.push('/infectiousPatients/map', extra: data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          // textAlign: TextAlign.center,
          text: const TextSpan(
              text: "ผู้ป่วยโรคติดต่อ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nข้อมูลของผู้ป่วย',
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
                    title: const Text('ชื่อ-นามสกุล'),
                    subtitle: TextFormField(
                      controller: name_lastname,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกชื่อ-นามสกุล';
                        }
                        return null;
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('อายุ'),
                    subtitle: TextFormField(
                      controller: _age,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกอายุ';
                        }
                        return null;
                      },
                    ),
                  ),
                  // ListTile(
                  //   contentPadding: EdgeInsets.zero,
                  //   title: const Text('เลขบัตรประตัวประชาชน'),
                  //   subtitle: TextFormField(
                  //     controller: id_card,
                  //     style: const TextStyle(color: Colors.black),
                  //     keyboardType: TextInputType.text,
                  //     decoration: InputDecoration(
                  //         filled: true,
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(5))),
                  //   ),
                  // ),
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
                                        _sex = 1;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: _sex == 1
                                              ? Colors.white
                                              : Colors.grey,
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              topLeft: Radius.circular(5))),
                                      child: Text("ชาย",
                                          style: TextStyle(
                                              color: _sex == 1
                                                  ? Colors.grey
                                                  : Colors.white,
                                              fontSize: 17)),
                                    ))),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child:
                                    Container(color: Colors.white, width: 1)),
                            Expanded(
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _sex = 2;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: _sex == 2
                                            ? Colors.white
                                            : Colors.grey,
                                      ),
                                      child: Text("หญิง",
                                          style: TextStyle(
                                              color: _sex == 2
                                                  ? Colors.grey
                                                  : Colors.white,
                                              fontSize: 17)),
                                    ))),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child:
                                    Container(color: Colors.white, width: 1)),
                            Expanded(
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _sex = 3;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: _sex == 3
                                              ? Colors.white
                                              : Colors.grey,
                                          borderRadius: const BorderRadius.only(
                                              bottomRight: Radius.circular(5),
                                              topRight: Radius.circular(5))),
                                      child: Text("ไม่ระบุ",
                                          style: TextStyle(
                                              color: _sex == 3
                                                  ? Colors.grey
                                                  : Colors.white,
                                              fontSize: 17)),
                                    ))),
                          ],
                        )),
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('หมายเลขโทรศัพท์'),
                    subtitle: TextFormField(
                      controller: _tel,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณาระบุหมายเลขโทรศัพท์';
                        }
                        return null;
                      },
                    ),
                  ),
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
                      onPressed: _nextMap,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
