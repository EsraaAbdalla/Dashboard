// ignore_for_file: unused_import

import 'package:dashboard_final/Login_page.dart';
import 'package:dashboard_final/Test_Page.dart';
import 'package:dashboard_final/dashboard.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
