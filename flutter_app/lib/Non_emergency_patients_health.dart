import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NonEmergencyPatientsHealth extends StatefulWidget {
  final Map<String, dynamic> data;
  const NonEmergencyPatientsHealth({super.key, required this.data});

  @override
  _NonEmergencyPatientsHealthState createState() =>
      _NonEmergencyPatientsHealthState();
}

class _NonEmergencyPatientsHealthState
    extends State<NonEmergencyPatientsHealth> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> data = {};
  TextEditingController symptom = TextEditingController();
  TextEditingController disease = TextEditingController();
  TextEditingController drug_allergy = TextEditingController();
  TextEditingController doctor = TextEditingController();
  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  void _nextAppointment() {
    if (_formKey.currentState!.validate()) {
      data.addAll({
        'symptom': symptom.text,
        'disease': disease.text,
        'drug_allergy': drug_allergy.text,
        'doctor': doctor.text
      });
      // print(data);
      context.push('/non_emergency_patients/health/appointment', extra: data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          // textAlign: TextAlign.center,
          text: const TextSpan(
              text: "ผู้ป่วยทั่วไป",
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nข้อมูลอาการ',
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
                    title: const Text('อาการเบื้องต้น'),
                    subtitle: TextFormField(
                      controller: symptom,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณาระบุอาการเบื้องต้น';
                        }
                        return null;
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('โรคประจำตัว(ถ้ามี)'),
                    subtitle: TextFormField(
                      controller: disease,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'เช่น โรคประจำตัว, ประวัติการผ่าตัด',
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('ประวัติการแพ้ยา'),
                    subtitle: TextFormField(
                      controller: drug_allergy,
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
                    title: const Text('แพทย์ที่รักษาประจำ (ถ้ามี)'),
                    subtitle: TextFormField(
                      controller: doctor,
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
                      onPressed: _nextAppointment,
                      child: Text("ถัดไป"),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
