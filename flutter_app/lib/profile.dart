import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/config.dart';
import 'package:flutter_app/constant/token_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _storage = const FlutterSecureStorage();
  var data;
  var member_image;
  var member_name;
  var member_lastname;
  var member_tel;
  var username;
  var member_birthdate;
  var birthdate;
  bool _isLoading = false;

  // var member_name;

  @override
  void initState() {
    readData();
    super.initState();
  }

  Future<void> readData() async {
    setState(() {
      _isLoading = true;
    });
    final id = await _storage.read(key: 'member_id');
    try {
      final token = await AuthService().loadToken();
      // print(token);
      final response = await http.get(
        Uri.parse('${Config.API_URL}/api-app/member/profile/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      setState(() {
        if (response.statusCode == 200) {
          data = jsonDecode(response.body);
          member_image = jsonDecode(response.body)['data'][0]['member_image'];
          member_name = jsonDecode(response.body)['data'][0]['member_name'];
          member_lastname =
              jsonDecode(response.body)['data'][0]['member_lastname'];
          member_tel = jsonDecode(response.body)['data'][0]['member_tel'];
          username = jsonDecode(response.body)['data'][0]['username'];

          member_birthdate = DateFormat("dd/MM/yyyy").format(DateTime.parse(
              jsonDecode(response.body)['data'][0]['member_birthdate']));
          _isLoading = false;
        } else {
          print('object');
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _logout() async {
    await AuthService().clearToken();
    context.push('/login');
  }

  // void r() => {result.map((name) => Text(name))};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "profile",
      //     style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
      //   ),
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.grey,
      // ),
      body: _isLoading
          ? Center(
              child: LoadingAnimationWidget.discreteCircle(
                color: Colors.blue,
                size: 50,
              ),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Form(
                  child: ListView(
                // padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                children: [
                  ListTile(
                    title: Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.14,
                          child: ClipOval(
                            child: member_image == null
                                ? const Center(
                                    child: FaIcon(
                                    FontAwesomeIcons.solidUser,
                                    size: 42,
                                  ))
                                : Image.network(
                                    '${Config.API_URL}/$member_image',
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        )),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          // color: Colors.amber,
                          // height: 100,
                          child: ListTile(
                            contentPadding: const EdgeInsets.only(right: 5),
                            title: const Text('ชื่อ',
                                style: TextStyle(fontSize: 16)),
                            subtitle: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12,
                              ),
                              child: Text('$member_name',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  )),
                            ),
                            dense: true,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // color: Colors.amber,
                          // height: 100,
                          child: ListTile(
                            contentPadding: const EdgeInsets.only(left: 5),
                            title: const Text('นามสกุล',
                                style: TextStyle(fontSize: 16)),
                            subtitle: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12,
                              ),
                              child: Text('$member_lastname',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  )),
                            ),
                            // dense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 5),
                    title: const Text('เบอร์โทรศัพท์',
                        style: TextStyle(fontSize: 16)),
                    subtitle: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: Text('$member_tel',
                          style: const TextStyle(
                            fontSize: 16,
                          )),
                    ),
                    dense: true,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 5),
                    title: const Text('ชื่อผู้ใช้งาน',
                        style: TextStyle(fontSize: 16)),
                    subtitle: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: Text('$username',
                          style: const TextStyle(
                            fontSize: 16,
                          )),
                    ),
                    dense: true,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 5),
                    title:
                        const Text('วันเกิด', style: TextStyle(fontSize: 16)),
                    subtitle: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: Text('$member_birthdate',
                          style: const TextStyle(
                            fontSize: 16,
                          )),
                    ),
                    dense: true,
                  ),
                ],
              ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: _logout,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.redAccent),
            foregroundColor: WidgetStateProperty.all(Colors.black87),
            minimumSize: WidgetStateProperty.all(const Size(150, 45)),
            elevation: WidgetStateProperty.all(0),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          //  () async {
          //   await AuthService().clearToken();
          //   context.push('/login');
          // },
          child: Text("ออกจากระบบ"),
        ),
      ),
    );
  }
}
