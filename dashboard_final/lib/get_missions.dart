// ignore_for_file: avoid_print, implementation_imports, prefer_typing_uninitialized_variables, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// var missions;

// void getMissions() async {
//   http.Response response = await http
//       .get(Uri.parse("https://graduation-project-svct.onrender.com/mission/"));
//   if (response.statusCode == 200) {
//     var newData = json.decode(response.body);
//     missions = newData;

//     print(missions[0]['missions']['planet1'][0]['NAME']);
//   } else {
//     print(response.statusCode);
//   }
// }

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
