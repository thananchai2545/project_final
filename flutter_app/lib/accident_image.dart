import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/config.dart';
import 'package:flutter_app/constant/token_manager.dart';
import 'package:dio/dio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AccidentImage extends StatefulWidget {
  final List data_patient;
  const AccidentImage({super.key, required this.data_patient});

  @override
  _AccidentImageState createState() => _AccidentImageState();
}

class _AccidentImageState extends State<AccidentImage> {
  final ImagePicker _picker = ImagePicker();
  List image = List.filled(6, null);
  final dio = Dio();

  Future<void> report_accident() async {
    List dataPatient = widget.data_patient;
    final memberId = await AuthService().loadMemberId();

    // data_patient[0]['image'] = image;
    AuthService().loadToken();
    dataPatient[0]['case_type'] = 'accident';
    dataPatient[0]['member_id'] = memberId;

    // print(AuthService().loadToken());
    // print(image[0].path);
    try {
      final token = await AuthService().loadToken();

      var request = http.MultipartRequest(
          'POST', Uri.parse('${Config.API_URL}/api-app/case/create'));

      request.headers['Authorization'] = 'bearer $token';
      request.fields['data_patient'] = jsonEncode(dataPatient[0]);
      for (var case_image in image) {
        // print(index);
        if (case_image != null) {
          request.files.add(
              await http.MultipartFile.fromPath('case_image', case_image.path));
        }
      }
      var response = await request.send();
      if (response.statusCode == 200) {
        print(200);
      } else {
        print('object');
      }

      // showDialog<String>(
      //     context: context,
      //     builder: (BuildContext context) => AlertDialog(
      //           title: const Center(child: Text('สร้างบัญชีเสร็จสิ้น')),
      //           actions: <Widget>[
      //             TextButton(
      //               onPressed: () => context.push('/login'),
      //               child: const Text('OK'),
      //             ),
      //           ],
      //         ));
    } catch (error) {
      print(error);
    }
  }

  Future showOptions(index) async {
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
              _pickImage(index);
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera(index);
            },
          ),
          CupertinoActionSheetAction(
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              removeFile(index);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(index) async {
    // final picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File? croppedFile = await _cropImage(File(pickedFile.path));
      if (croppedFile != null) {
        setState(() {
          // _image = croppedFile;
          image[index] = croppedFile;
        });
      }
    }
  }

  Future getImageFromCamera(index) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File? croppedFile = await _cropImage(File(pickedFile.path));
      if (croppedFile != null) {
        setState(() {
          // _image = ;
          image[index] = croppedFile;
        });
      }
    }
  }

  Future removeFile(index) async {
    setState(() {
      image[index] = null;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: RichText(
            text: const TextSpan(
                text: "อุบัติเหตุ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\nรูปภาพประกอบ',
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
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const SizedBox(
                    height: 40,
                    child: Text('รูปภาพประกอบ'),
                  ),
                  subtitle: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: List.generate(image.length, (index) {
                      return InkWell(
                          onTap: () {
                            showOptions(index);
                          },
                          child: image[index] == null
                              ? Container(
                                  // padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.camera,
                                      color: Colors.black26,
                                    ),
                                  ))
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.file(
                                    image[index],
                                    fit: BoxFit.cover,
                                  ),
                                ));
                    }),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.redAccent),
                      foregroundColor: WidgetStateProperty.all(Colors.black87),
                      minimumSize: WidgetStateProperty.all(const Size(150, 45)),
                      elevation: WidgetStateProperty.all(0),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: report_accident,
                    child: Text("แจ้งอุบัติเหตุ"),
                  ),
                ),
              ],
            )));
  }
}
