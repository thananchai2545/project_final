// import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/constant/config.dart';
import 'package:flutter_app/constant/token_manager.dart';

import 'package:flutter_app/model/symtom_model.dart';
import 'package:flutter_app/widget/textformfield.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class Accident extends StatefulWidget {
  const Accident({super.key});

  @override
  _AccidentState createState() => _AccidentState();
}

class _AccidentState extends State<Accident> {
  final _formKey = GlobalKey<FormState>();

  int selected_breathe = 0;
  int violence = 0;
  List data = [];
  bool setSymptomOption = true;
  late Future<List<SymptomModel>> futureDataSymtom;
  List symtomSelect = [];
  final TextEditingController other_symptoms = TextEditingController();
  // final TextEditingController number_patients = TextEditingController();

  @override
  void initState() {
    // symptom();
    futureDataSymtom = fetchDataSymptom();

    super.initState();
  }

  Future<List<SymptomModel>> fetchDataSymptom() async {
    final token = await AuthService().loadToken();
    final response = await http.get(
      Uri.parse('${Config.API_URL}/api-app/symptom/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List data = await jsonDecode(response.body)['symptom'];
      return data.map((json) => SymptomModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  void _accident_map() {
    if (selected_breathe == 0) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            'ผู้ป่วยหายใจหรือไม่',
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
    } else if (_formKey.currentState!.validate()) {
      // other_symptoms.text = null;
      // Null d = null;
      // other_symptoms.text = '';
      Map<String, dynamic> dataPatient = {
        // "case_number_patients": number_patients.text,
        "case_breathe": selected_breathe,
        "case_symtomSelect": symtomSelect,
        "case_other_symptoms": other_symptoms.text
      };
      print(other_symptoms.text.isEmpty);
      // null;
      context.push('/emergencypatient/accident/accident_map',
          extra: dataPatient);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          // textAlign: TextAlign.center,
          text: const TextSpan(
              text: "อุบัติเหตุ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nเลือกอาการของผู้ป่วย',
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
            child: Column(children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('หายใจหรือไม่'),
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
                                  child: Text("หายใจ",
                                      style: TextStyle(
                                          color: selected_breathe == 1
                                              ? Colors.grey
                                              : Colors.white,
                                          fontSize: 17)),
                                ))),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(color: Colors.white, width: 2)),
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
                                  child: Text("ไม่หายใจ",
                                      style: TextStyle(
                                          color: selected_breathe == 2
                                              ? Colors.grey
                                              : Colors.white,
                                          fontSize: 17)),
                                ))),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(color: Colors.white, width: 2)),
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
                                  child: Text("ไม่แน่ใจ",
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
                title: const Text('อาการเบื้องต้น'),
                subtitle: FutureBuilder<List<SymptomModel>>(
                    future: futureDataSymtom,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<SymptomModel>? data = snapshot.data;
                        print(data);
                        return GridView.builder(
                            padding: const EdgeInsets.all(0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 90 / 25,
                              crossAxisCount: 2,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: CheckboxListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title:
                                      Text(data[index].symptomName.toString()),
                                  value: data[index].isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      data[index].isChecked = value!;
                                      if (value) {
                                        symtomSelect.add(data[index].id);
                                      } else {
                                        symtomSelect.remove(data[index].id);
                                      }
                                    });
                                  },
                                ),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return const Center(child: CircularProgressIndicator());
                    }),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('อาการอื่นๆ เพิ่มเติม'),
                subtitle: TextFormField(
                  controller: other_symptoms,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  // validator: (text) {
                  //   if (text == null || text.isEmpty) {
                  //     return other_symptoms.text = 'null';
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
                  onPressed: _accident_map,
                  child: Text("ถัดไป"),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
