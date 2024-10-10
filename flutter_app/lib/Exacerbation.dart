import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class Exacerbation extends StatefulWidget {
  const Exacerbation({Key? key}) : super(key: key);

  @override
  _ExacerbationState createState() => _ExacerbationState();
}

class _ExacerbationState extends State<Exacerbation> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name_lastname = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController id_card = TextEditingController();
  final TextEditingController drug_allergy = TextEditingController();
  final TextEditingController prescription_drugs = TextEditingController();
  int selected_sex = 0;

  void _nextEvent() {
    Map<String, dynamic> data = {
      'name_lastname': _name_lastname.text,
      'age': _age.text,
      'id_card': id_card.text,
      'drug_allergy': drug_allergy.text,
      'prescription_drugs': prescription_drugs.text,
      'sex': selected_sex
    };
    print(data);
    context.push('/emergencypatient/exacerbation/event', extra: data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: RichText(
            text: const TextSpan(
                text: "โรคกำเริบ",
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
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('ชื่อ-นามสกุล'),
                      subtitle: TextFormField(
                        controller: _name_lastname,
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('อายุ'),
                      subtitle: TextFormField(
                        controller: _age,
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('เพศ'),
                      subtitle: Container(
                          height: 40,
                          padding: EdgeInsets.all(2),
                          margin: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
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
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    topLeft:
                                                        Radius.circular(5))),
                                        child: Text("ชาย",
                                            style: TextStyle(
                                                color: selected_sex == 1
                                                    ? Colors.grey
                                                    : Colors.white,
                                                fontSize: 17)),
                                      ))),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child:
                                      Container(color: Colors.white, width: 1)),
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
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child:
                                      Container(color: Colors.white, width: 1)),
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
                                            borderRadius: BorderRadius.only(
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
                      title: Text('เลขประจำตัวประชาชน'),
                      subtitle: TextFormField(
                        controller: id_card,
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('ประวัติการแพ้ยา หรือโรคประจำตัวอื่น ๆ'),
                      subtitle: TextFormField(
                        controller: drug_allergy,
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('การใช้ยาในปัจจุบัน (ยาประจำตัว)'),
                      subtitle: TextFormField(
                        controller: prescription_drugs,
                        style: TextStyle(color: Colors.black),
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
                            backgroundColor: MaterialStateProperty.all(
                                Colors.green.shade600),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black87),
                            minimumSize:
                                MaterialStateProperty.all(Size(150, 45)),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: _nextEvent),
                    ),
                  ]))),
        ));
  }
}
