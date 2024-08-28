import 'package:flutter/material.dart';

class SpecialPatients extends StatefulWidget {
  const SpecialPatients({Key? key}) : super(key: key);

  @override
  _SpecialPatientsState createState() => _SpecialPatientsState();
}

class _SpecialPatientsState extends State<SpecialPatients> {
  bool visible_detail1 = false;
  bool visible_detail2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: RichText(
            // textAlign: TextAlign.center,
            text: const TextSpan(
                text: "ผู้ป่วยพิเศษ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\nผู้ป่วยพิเศษสามารถระบุอุปกรณ์ที่ต้องการได้',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ]),
          ),
          backgroundColor: Colors.grey,
        ),
        body: Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.pink,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 15, right: 10),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Text('data'),
                          Spacer(),
                          // Icon(Icons.arrow_downward_rounded)
                          (visible_detail1 == true)
                              ? Icon(Icons.arrow_upward_rounded)
                              : Icon(Icons.arrow_downward_rounded),
                        ],
                      ),
                    ),
                    onTap: () => {
                      setState(() {
                        visible_detail1 =
                            (visible_detail1 == true) ? false : true;
                      })
                    },
                  ),
                  Visibility(
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.only(left: 15, right: 10),
                      margin: EdgeInsets.only(bottom: 10),
                      // color: Colors.grey,
                      child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
                    ),
                    // maintainSize: true,
                    // maintainAnimation: true,
                    // maintainState: true,
                    visible: visible_detail1,
                  ),
                  InkWell(
                    child: Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 15, right: 10),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Text('data'),
                          Spacer(),
                          // Icon(Icons.arrow_downward_rounded)
                          (visible_detail2 == true)
                              ? Icon(Icons.arrow_upward_rounded)
                              : Icon(Icons.arrow_downward_rounded),
                        ],
                      ),
                    ),
                    onTap: () => {
                      setState(() {
                        visible_detail2 =
                            (visible_detail2 == true) ? false : true;
                      })
                    },
                  ),
                  Visibility(
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.only(left: 15, right: 10),
                      margin: EdgeInsets.only(bottom: 10),
                      // color: Colors.grey,
                      child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
                    ),
                    visible: visible_detail2,
                  ),
                ],
              ),
            ),
          ),
          // Container(
          //     width: 340,
          //     height: 70,
          //     child: )
        ]),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: SizedBox(
            height: 60, // Adjust the height as per your requirement
            child: ElevatedButton(
              onPressed: () {
                // Add your onPressed callback here
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
        )
        // bottomNavigationBar: Container(
        //    height: 70,
        //   child: Padding(
        //     padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
        //     child: Container(
        //       child: ElevatedButton(
        //         onPressed: () {
        //           // Navigator.push(
        //           //     context,
        //           //     MaterialPageRoute(
        //           //         builder: (context) => MovePatient()));
        //           // Navigator.pushNamed(context, 'page_detail');
        //         },
        //         child: Text(
        //           "ถัดไป",
        //           style: TextStyle(fontSize: 18),
        //         ),

        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
