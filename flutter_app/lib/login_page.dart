// import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:localstorage/localstorage.dart';
import 'package:flutter_app/constant/config.dart';
import 'package:flutter_app/constant/token_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

// import 'package:app/buttom_layout.dart';
// import 'package:app/home_page.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // symptom();
    _usernameController.text = 'admin';
    _passwordController.text = '1234';
    super.initState();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse(Config.API_URL + '/api-app/member/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': _usernameController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // String data = jsonDecode(response.body)['data'][0]['username'];
        Map<String, dynamic> s = jsonDecode(response.body);
        await AuthService().saveToken(s);
        context.push('/');
      } else {
        print(jsonDecode(response.body));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${jsonDecode(response.body)['message']}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(20),
          // padding: EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MediaQuery.of(context).viewInsets.bottom != 0
                    ? Container()
                    : Image.asset(
                        'assets/images/logo_login.png',
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5,
                      ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Align(
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
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _usernameController,
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
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'โปรดป้อนชื่อผู้ใช้';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          style: TextStyle(color: Colors.white),
                          // keyboardType: TextInputType.text,
                          obscureText: true,
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
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'โปรดป้อนรหัสผ่าน';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            child: ElevatedButton(
                          onPressed: _login,
                          child: Text("เข้าสู่ระบบ"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.redAccent),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black87),
                            minimumSize:
                                MaterialStateProperty.all(Size(150, 45)),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        )),
                      ],
                    )),
                Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      child: Text("ลืมรหัสผ่านใช่หรือไม่ ?"),
                      onTap: () {
                        print("value of your text");
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      child: Text("สร้างบัญชีใหม่"),
                      onTap: () {
                        context.push('/register');
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
