// ignore_for_file: camel_case_types, duplicate_ignore, file_names

import 'package:dashboard_final/good_page.dart';
import 'package:dashboard_final/verygood_page.dart';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class Missions extends StatefulWidget {
  const Missions({super.key});

  @override
  State<Missions> createState() => _MissionsState();
}

class _MissionsState extends State<Missions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //     image: AssetImage("images/Base.png"), fit: BoxFit.cover),
          ),
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 40,
              backgroundColor: Colors.blue,

              // backgroundColor: Colors.grey.withOpacity(0.9),
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.done)),
                  Tab(icon: Icon(Icons.done_all_sharp)),
                ],
              ),
              title: const Text('Missions'),
            ),
            body: const TabBarView(
              children: <Widget>[
                GoodPage(),
                VeryGoodPage(),
              ],
              // ),
            ),
          )),
    );
  }
}
