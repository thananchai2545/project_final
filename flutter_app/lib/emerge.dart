import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Emerge extends StatefulWidget {
  const Emerge({super.key});

  @override
  _EmergeState createState() => _EmergeState();
}

class _EmergeState extends State<Emerge> {
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
                  text: '\nสำหรับผู้ป่วยอุบัตเหตุ',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ]),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.pinkAccent),
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                      'ทางผู้รับแจ้งจะติดต่อรถที่ใกล้ที่สุดเพื่องไปยังที่เกิดเหตุ'),
                ),
                Container(
                  height: 70,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                      'ทางทีมผู้ช่วยเหลือจะเตรียมอุปกรณ์สำหรับอุบัติเหตุโดยเฉพาะ'),
                )
              ],
            ),
          ),
        ],
      )),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => MovePatient()));
            // Navigator.pushNamed(context, 'page_detail');
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(const Color(0xff32303b)),
            foregroundColor: WidgetStateProperty.all(Colors.redAccent),
            // minimumSize: MaterialStateProperty.all(Size(150, 45)),
            elevation: WidgetStateProperty.all(0),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          child: Text(
            "ถัดไป",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
