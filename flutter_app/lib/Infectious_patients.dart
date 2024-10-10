import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfectiousPatients extends StatefulWidget {
  const InfectiousPatients({Key? key}) : super(key: key);

  @override
  _InfectiousPatientsState createState() => _InfectiousPatientsState();
}

class _InfectiousPatientsState extends State<InfectiousPatients> {
  final _formKey = GlobalKey();
  TextEditingController name_lastname = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController id_card = TextEditingController();
  TextEditingController _sex = TextEditingController();
  TextEditingController _tel = TextEditingController();
  void _nextMap() {
    Map<String, dynamic> data = {
      'name_lastname': name_lastname.text,
      'age': _age.text,
      'id_card': id_card.text,
      'sex': _sex.text,
      'tel': _tel.text,
    };
    context.push('/infectiousPatients/map', extra: data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          // textAlign: TextAlign.center,
          text: const TextSpan(
              text: "ผู้ป่วยสภาวะแพร่เชื้อ",
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
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('เลขบัตรประตัวประชาชน'),
                    subtitle: TextFormField(
                      controller: id_card,
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
                    subtitle: TextFormField(
                      controller: _sex,
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
                    title: const Text('หมายเลขโทรศัพท์'),
                    subtitle: TextFormField(
                      controller: _tel,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
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
