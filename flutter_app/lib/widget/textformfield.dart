// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomInputDecoration {
  static InputDecoration build({required String name, Icon? icon
      // String? hintText,
      // Widget? prefixIcon,
      }) {
    return InputDecoration(
      isDense: true,
      filled: true,
      label: Text(name),
      labelStyle: const TextStyle(color: Colors.black),
      suffixIcon: icon,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          )),
    );
    // InputDecoration(
    //   contentPadding: EdgeInsets.only(left: 50),
    //   prefixIcon: Icon(Icons.person),
    //   prefixIconColor: Colors.black,
    //   labelText: labelText,
    //   filled: true,
    //   border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10.0),
    //       borderSide: const BorderSide(
    //         width: 0,
    //       )),
    // );
  }
}


// Future<dynamic> decoration() async {
//   return InputDecoration(
//     contentPadding: EdgeInsets.only(left: 50),
//     prefixIcon: Icon(Icons.person),
//     prefixIconColor: Colors.black,
//     labelText: "ชื่อผู้ใช้",
//     filled: true,
//     border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10.0),
//         borderSide: const BorderSide(
//           width: 0,
//         )),
//   );
// }
