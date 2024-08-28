import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/buttom_layout.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    // String username = _usernameController.text.trim();
    // String password = _passwordController.text.trim();
    print(1231);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(20),
          // padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_login.png',
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Align(
                        // width: 300,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 27,
                              color: Colors.red.shade400,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'เข้าสู่ระบบ',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    prefixIconColor: Colors.white,
                    hintText: "ชื่อผู้ใช้",
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.blueGrey.shade900,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        )),
                  ),
                  onChanged: (value) {
                    setState(() {
                      
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    prefixIconColor: Colors.white,
                    hintText: "รหัสผ่าน",
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.blueGrey.shade900,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // SizedBox(
                //   height: 50,
                //   width: double.infinity,
                //   child: ElevatedButton(
                //       style: ButtonStyle(
                //           shape: MaterialStateProperty.all<
                //                   RoundedRectangleBorder>(
                //               RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10.0),
                //           )),
                //           backgroundColor:
                //               MaterialStateProperty.all<Color>(
                //                   Colors.blueGrey.shade900),
                //           foregroundColor:
                //               MaterialStateProperty.all<Color>(
                //                   Colors.white)),
                //       onPressed: () {},
                //       child: Align(
                //           alignment: Alignment.centerLeft,
                //           child: Row(children: [
                //             Container(
                //               margin: EdgeInsets.only(right: 10),
                //               child: Icon(Icons.phone),
                //             ),
                //             Container(
                //               child: const Text('เบอร์โทรศัพท์',
                //                   textAlign: TextAlign.left),
                //             )
                //           ]))),
                // ),
                // const SizedBox(
                //   height: 8,
                // ),
                // SizedBox(
                //   height: 50,
                //   width: double.infinity,
                //   child: ElevatedButton(
                //       style: ButtonStyle(
                //           shape: MaterialStateProperty.all<
                //                   RoundedRectangleBorder>(
                //               RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10.0),
                //           )),
                //           backgroundColor:
                //               MaterialStateProperty.all<Color>(
                //                   Colors.blueGrey.shade900),
                //           foregroundColor:
                //               MaterialStateProperty.all<Color>(
                //                   Colors.white)),
                //       onPressed: () {},
                //       child: Align(
                //         alignment: Alignment.centerLeft,
                //         child: Row(
                //           children: [
                //             Container(
                //                 margin: EdgeInsets.only(right: 10),
                //                 child: FaIcon(FontAwesomeIcons.facebook)
                //                 // Icon(FontAwesomeIcons.facebook, color: widget.color, size: 16.0)
                //                 ),
                //             Container(
                //               child: Text('Facebook',
                //                   textAlign: TextAlign.left),
                //             )
                //           ],
                //         ),
                //       )),
                // ),
                // const SizedBox(
                //   height: 8,
                // ),
                // SizedBox(
                //   height: 50,
                //   width: double.infinity,
                //   child: ElevatedButton(
                //       style: ButtonStyle(
                //           shape: MaterialStateProperty.all<
                //                   RoundedRectangleBorder>(
                //               RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10.0),
                //           )),
                //           backgroundColor:
                //               MaterialStateProperty.all<Color>(
                //                   Colors.blueGrey.shade900),
                //           foregroundColor:
                //               MaterialStateProperty.all<Color>(
                //                   Colors.white)),
                //       onPressed: () {},
                //       child: Align(
                //         alignment: Alignment.centerLeft,
                //         child: Row(
                //           children: [
                //             Container(
                //               margin: EdgeInsets.only(right: 10),
                //               child: FaIcon(FontAwesomeIcons.google),
                //             ),
                //             Container(
                //               child: const Text('Google',
                //                   textAlign: TextAlign.left),
                //             )
                //           ],
                //         ),
                //       )),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                Column(
                  children: [
                    Container(
                        // width: 300,
                        // color: Colors.white,
                      child: ElevatedButton(
                      onPressed: _login,
                      child: Text("เข้าสู่ระบบ"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black87),
                        minimumSize: MaterialStateProperty.all(Size(150, 45)),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      child: Text("Forgot Password ?"),
                      onTap: () {
                        print("value of your text");
                      },
                    )
                    // TextButton(
                    //   style: TextButton.styleFrom(
                    //     // textStyle: const TextStyle(fontSize: 20),
                    //   ),
                    //   onPressed: () {},
                    //   child: const Text('Forgot Password ?', style: TextStyle(color: Colors.black87),),
                    // )
                    // Container(
                    //   // width: 300,
                    //   // color: Colors.pink,
                    //   // alignment: Alignment.center,
                    //   margin: EdgeInsets.only(left: 9),
                    //   // child: Text('Forgot Password ?'),
                    //   child: ,
                    // )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
