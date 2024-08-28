// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:go_router/go_router.dart';

class AccidentContact extends StatefulWidget {
  final List data_patient;
  const AccidentContact({Key? key, required this.data_patient})
      : super(key: key);

  @override
  _AccidentContactState createState() => _AccidentContactState();
}

class _AccidentContactState extends State<AccidentContact> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _idcardController = TextEditingController();
  final TextEditingController _drugallergyController = TextEditingController();

  void _accident_image() {
    if (_formKey.currentState!.validate()) {
      List data_patient = widget.data_patient;
      data_patient[0]['case_name'] = _nameController.text;
      data_patient[0]['case_tel'] = _telController.text.replaceAll(" ", "");
      data_patient[0]['case_idcard'] =
          _idcardController.text.replaceAll('-', '');
      data_patient[0]['case_drugallergy'] = _drugallergyController.text;
      // print(data_patient);
      context.push('/accident/accident_map/accident_contact/accident_image',
          extra: data_patient);
      //   // print(_idcardController.text.replaceAll('-', '').length);
      // print(_telController.text.replaceAll(" ", ""));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
              text: "อุบัติเหตุ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nผู้ติดต่อ',
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
                  title: Text('ข้อมูลผู้แจ้งเหตุ'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('ชื่อ - นามสกุล'),
                  subtitle: TextFormField(
                    controller: _nameController,
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
                  title: Text('เบอร์โทรศัพท์'),
                  subtitle: TextFormField(
                    inputFormatters: [
                      MaskTextInputFormatter(mask: '### ### ####')
                    ],
                    controller: _telController,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    validator: (text) {
                      if (text == null ||
                          text.isEmpty ||
                          text.replaceAll(" ", "").length != 10) {
                        return 'หมายเลขโทรศัพท์ไม่ถูกต้อง';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('หมายเลขบัตรประชาชน 13 หลัก'),
                  subtitle: TextFormField(
                    inputFormatters: [
                      MaskTextInputFormatter(mask: '#-####-#####-##-#')
                    ],
                    controller: _idcardController,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "0-0000-00000-00-0",
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    validator: (text) {
                      if (text == null ||
                          text.isEmpty ||
                          text.replaceAll('-', '').length != 13) {
                        return 'หมายเลขบัตรประชาชนไม่ถูกต้อง';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('อาการแพ้ยา (หากทราบ)'),
                  subtitle: TextFormField(
                    controller: _drugallergyController,
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
                      backgroundColor:
                          MaterialStateProperty.all(Colors.green.shade600),
                      foregroundColor:
                          MaterialStateProperty.all(Colors.black87),
                      minimumSize: MaterialStateProperty.all(Size(150, 45)),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: _accident_image,
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
