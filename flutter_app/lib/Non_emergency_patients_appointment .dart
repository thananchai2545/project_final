import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NonEmergencyPatientsAppointment extends StatefulWidget {
  final Map<String, dynamic> data;
  const NonEmergencyPatientsAppointment({
    super.key,
    required this.data,
  });

  @override
  _NonEmergencyPatientsAppointmentState createState() =>
      _NonEmergencyPatientsAppointmentState();
}

class _NonEmergencyPatientsAppointmentState
    extends State<NonEmergencyPatientsAppointment> {
  TextEditingController address = TextEditingController();
  TextEditingController landmarks = TextEditingController();
  Map<String, dynamic> data = {};
  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  void _nextDestination() {
    data.addAll({'address': address.text, 'landmarks': landmarks.text});
    context.push('/non_emergency_patients/health/appointment/destination',
        extra: data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          // textAlign: TextAlign.center,
          text: const TextSpan(
              text: "ผู้ป่วยฉุกเฉินไม่ฉุกเฉิน",
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nข้อมูลที่อยู่',
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
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('ที่อยู่ปัจจุบัน'),
                subtitle: TextFormField(
                  controller: address,
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
                title: const Text('จุดสังเกต'),
                subtitle: TextFormField(
                  controller: landmarks,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Google map'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.green.shade600),
              foregroundColor: WidgetStateProperty.all(Colors.black87),
              minimumSize: WidgetStateProperty.all(const Size(150, 45)),
              elevation: WidgetStateProperty.all(0),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            onPressed: _nextDestination,
            child: Text("ถัดไป"),
          ),
        ),
      ),
    );
  }
}
