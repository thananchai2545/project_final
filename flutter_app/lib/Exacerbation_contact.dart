import 'package:flutter/material.dart';
import 'package:flutter_app/constant/config.dart';
import 'package:flutter_app/constant/token_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class ExacerbationContact extends StatefulWidget {
  final Map<String, dynamic> data;
  const ExacerbationContact({super.key, required this.data});

  @override
  _ExacerbationContactState createState() => _ExacerbationContactState();
}

class _ExacerbationContactState extends State<ExacerbationContact> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name_lastname_Informer = TextEditingController();
  TextEditingController relationship = TextEditingController();
  TextEditingController tel = TextEditingController();
  Map<String, dynamic> data = {};
  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  Future<void> _report() async {
    final token = await AuthService().loadToken();
    print(data);
    try {
      var request = http.post(
          Uri.parse('${Config.API_URL}/api-app/exacerbation/create'),
          headers: {
            "Authorization": 'bearer $token',
          },
          body: {
            'name_lastname': data['name_lastname'],
            'age': data['age'],
            'id_card': data['id_card'],
            'drug_allergy': data['drug_allergy'],
            'prescription_drugs': data['prescription_drugs'],
            'sex': data['sex'].toString(),
            'date_incident': data['date_incident'],
            'location_incident': data['location_incident'],
            'symptom': data['symptom'],
            'period': data['period'],
            'assistance': data['assistance'],
            'address': data['address'],
            'landmarks': data['landmarks'],
            'name_lastname_Informer': name_lastname_Informer.text,
            'relationship': relationship.text,
            'tel': tel.text
          }).then((response) {
        if (response.statusCode == 200) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text(
                'แจ้งเหตุเสร็จสิ้น',
                style: TextStyle(fontSize: 18),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => context.push('/'),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          // textAlign: TextAlign.center,
          text: const TextSpan(
              text: "โรคกำเริบ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nข้อมูลผู้แจ้งเหตุ',
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
                    title: const Text('ชื่อ-นามสกุล ผู้แจ้ง'),
                    subtitle: TextFormField(
                      controller: name_lastname_Informer,
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
                    title: const Text('ความสัมพันธ์กับผู้ป่วย'),
                    subtitle: TextFormField(
                      controller: relationship,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'เช่น ญาติ, ผู้ดูแล, เจ้าหน้าที่',
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('หมายเลขโทรศัพท์ติดต่อกลับ'),
                    subtitle: TextFormField(
                      controller: tel,
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
                            WidgetStateProperty.all(Colors.red.shade400),
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
                      onPressed: _report,
                      child: Text("แจ้งเหตุ"),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
