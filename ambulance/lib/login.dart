import 'dart:convert';

import 'package:ambulance/constant/config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'constant/token_maneger.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  bool _obscurePassword = true;

  @override
  initState() {
    _controllerUsername.text = 'admin';
    _controllerPassword.text = '1234';
    super.initState();
  }

  Future<void> _login() async {
    var response = await http.post(
        Uri.parse('${Config.API_URL}/api-ambulance/ambulance/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'username': _controllerUsername.text,
          'password': _controllerPassword.text
        }));

    // print(response);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body)['token']);
      var token = jsonDecode(response.body)['token'];
      await AuthService().saveToken(token);
      // await AuthService()
      //     .saveToken(jsonDecode(response.body)['token'].toString());
      await AuthService()
          .saveId(jsonDecode(response.body)['data'][0]['id'].toString());
      context.push('/');
    } else {
      throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 150),
              Text(
                "แอพรถพยาบาล",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "สำหรับผู้ป่วยพิเศษ",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 60),
              TextFormField(
                controller: _controllerUsername,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onEditingComplete: () => _focusNodePassword.requestFocus(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerPassword,
                focusNode: _focusNodePassword,
                obscureText: _obscurePassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: _obscurePassword
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: _login,
                    child: const Text("Login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
