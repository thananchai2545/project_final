// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:go_router/go_router.dart';

class AccidentContact extends StatefulWidget {
  final List data_patient;
  const AccidentContact({super.key, required this.data_patient});

  @override
  _AccidentContactState createState() => _AccidentContactState();
}

class _AccidentContactState extends State<AccidentContact> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _idcardController = TextEditingController();

  void _accident_image() {
    if (_formKey.currentState!.validate()) {
      List dataPatient = widget.data_patient;
      dataPatient[0]['case_name'] = _nameController.text;
      dataPatient[0]['case_tel'] = _telController.text.replaceAll(" ", "");
      dataPatient[0]['case_idcard'] =
          _idcardController.text.replaceAll('-', '');
      // print(data_patient);
      context.push(
          '/emergencypatient/accident/accident_map/accident_contact/accident_image',
          extra: dataPatient);
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
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('ข้อมูลผู้แจ้งเหตุ'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('ชื่อ - นามสกุล'),
                  subtitle: TextFormField(
                    controller: _nameController,
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
                    // inputFormatters: [
                    //   MaskTextInputFormatter(mask: '### ### ####')
                    // ],
                    controller: _telController,
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    // validator: (text) {
                    //   if (text == null ||
                    //       text.isEmpty ||
                    //       text.replaceAll(" ", "").length != 10) {
                    //     return 'หมายเลขโทรศัพท์ไม่ถูกต้อง';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('หมายเลขบัตรประชาชน 13 หลัก'),
                  subtitle: TextFormField(
                    // inputFormatters: [
                    //   MaskTextInputFormatter(mask: '#-####-#####-##-#')
                    // ],
                    controller: _idcardController,
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        // hintText: "0-0000-00000-00-0",
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    // validator: (text) {
                    //   if (text == null ||
                    //       text.isEmpty ||
                    //       text.replaceAll('-', '').length != 13) {
                    //     return 'หมายเลขบัตรประชาชนไม่ถูกต้อง';
                    //   }
                    //   return null;
                    // },
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
                    onPressed: _accident_image,
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
