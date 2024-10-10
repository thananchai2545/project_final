import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/constant/config.dart';
import 'package:flutter_app/widget/textformfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _birtdayController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future<void> _pickImage() async {
    // final picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File? croppedFile = await _cropImage(File(pickedFile.path));
      if (croppedFile != null) {
        setState(() {
          _image = croppedFile;
        });
      }
    }
  }

  Future getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File? croppedFile = await _cropImage(File(pickedFile.path));
      if (croppedFile != null) {
        setState(() {
          _image = croppedFile;
        });
      }
    }
  }

  Future removeFile() async {
    setState(() {
      _image = null;
    });
  }

  Future<File?> _cropImage(File imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        maxWidth: 1080,
        maxHeight: 1080,
        aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
        uiSettings: [
          AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
          )
        ]);
    if (croppedFile != null) {
      return File(croppedFile.path);
    }
    return null;
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              _pickImage();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              removeFile();
            },
          ),
        ],
      ),
    );
  }

  void _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy ').format(pickedDate);
      setState(() {
        _birtdayController.text = formattedDate;
      });
    } else {
      print("Date is not selected");
    }
  }

  void _register() async {
    // print(_birtdayController.text);
    if (_formKey.currentState!.validate()) {
      print(_image);
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Config.API_URL}/api-app/member/register'));
      request.fields['member_name'] = _nameController.text;
      request.fields['member_lastname'] = _lastnameController.text;
      request.fields['member_tel'] = _telController.text;
      request.fields['username'] = _usernameController.text;
      request.fields['password'] = _passwordController.text;
      request.fields['member_birthdate'] = _birtdayController.text;
      if (_image != null) {
        request.files
            .add(await http.MultipartFile.fromPath('member_img', _image!.path));
      }
      var response = await request.send();
      if (response.statusCode == 200) {
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Center(child: Text('สร้างบัญชีเสร็จสิ้น')),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => context.push('/login'),
                      child: const Text('OK'),
                    ),
                  ],
                ));
      } else {
        print(12312);
        // Handle error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "สร้างบัญชีผู้ใช้",
            style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
          ),
          // automaticallyImplyLeading: false,
          // backgroundColor: Colors.grey,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () => showOptions(),
                                child: CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.width * 0.14,
                                  child: _image == null
                                      ? const Center(
                                          child: FaIcon(
                                          FontAwesomeIcons.solidUser,
                                          size: 42,
                                        ))
                                      : ClipOval(
                                          child: Image.file(
                                            _image!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text('อัปโหลดรูปโปรไฟล์ประจำตัว')
                            ],
                          )),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _nameController,
                              style: const TextStyle(color: Colors.black),
                              keyboardType: TextInputType.text,
                              decoration:
                                  CustomInputDecoration.build(name: 'ชื่อ'),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'โปรดป้อนชื่อ';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _lastnameController,
                              style: const TextStyle(color: Colors.black),
                              // keyboardType: TextInputType.text,
                              decoration:
                                  CustomInputDecoration.build(name: 'นามสกุล'),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'โปรดป้อนนามสกุล';
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _telController,
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration:
                            CustomInputDecoration.build(name: 'เบอร์โทรศัพท์'),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'โปรดป้อนเบอร์โทรศัพท์';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _usernameController,
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration:
                            CustomInputDecoration.build(name: 'ชื่อผู้ใช้'),
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
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration:
                            CustomInputDecoration.build(name: 'รหัสผ่าน'),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'โปรดป้อนรหัสผ่าน';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _birtdayController,
                        decoration: CustomInputDecoration.build(
                            name: 'วันเกิด',
                            icon: const Icon(Icons.calendar_today)),
                        readOnly: true, // when true user cannot edit text
                        onTap: _selectDate,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'โปรดเลือกวันเกิด';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  Colors.green.shade400),
                              foregroundColor:
                                  WidgetStateProperty.all(Colors.black87),
                              // minimumSize: MaterialStateProperty.all(Size(150, 45)),
                              elevation: WidgetStateProperty.all(0),
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            onPressed: _register,
                            child: Text("สมัครบัญชีผู้ใช้"),
                          ))
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
