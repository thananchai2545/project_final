import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Emerge extends StatefulWidget {
  const Emerge({Key? key}) : super(key: key);

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
            height: MediaQuery.of(context).size.height /4,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.pinkAccent),
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text('ทางผู้รับแจ้งจะติดต่อรถที่ใกล้ที่สุดเพื่องไปยังที่เกิดเหตุ'),
                ),
                Container(
                  height: 70,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  
                  child: Text(
                      'ทางทีมผู้ช่วยเหลือจะเตรียมอุปกรณ์สำหรับอุบัติเหตุโดยเฉพาะ'),
                )
              ],
            ),
          ),
         
          
        ],
      )),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => MovePatient()));
            // Navigator.pushNamed(context, 'page_detail');
          },
          child: Text(
            "ถัดไป",
            style: TextStyle(fontSize: 18),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff32303b)),
            foregroundColor: MaterialStateProperty.all(Colors.redAccent),
            // minimumSize: MaterialStateProperty.all(Size(150, 45)),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
