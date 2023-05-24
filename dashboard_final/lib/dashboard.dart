// ignore_for_file: override_on_non_overriding_member, unused_element, non_constant_identifier_names, no_logic_in_create_state, sized_box_for_whitespace, unnecessary_const, library_private_types_in_public_api, prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';

import 'package:dashboard_final/Test_Page.dart';
import 'package:dashboard_final/children_page.dart';

import 'package:dashboard_final/parent_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var missions;

getMissions() async {
  http.Response response = await http.get(Uri.parse(
      "https://graduation-project-svct.onrender.com/mission/missionlist"));
  if (response.statusCode == 200) {
    var newData = json.decode(response.body);
    missions = newData;

    // print(missions[0]['missions']['planet1'][0]['NAME']);
  } else {
    print(response.statusCode);
  }
  return missions;
}

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  __DashBoardState createState() => __DashBoardState();

  @override
  State<StatefulWidget> CreateState() => throw UnimplementedError();
}

class __DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Container(
                color: Colors.blue,
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Builder(
                      builder: (context) => GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: const Icon(Icons.menu)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'DashBoard',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )),
          backgroundColor: Colors.white,
          body: const Center(
            child: Text(
              "Hi Admin",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: 75,
                  child: const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Menu'),
                  ),
                ),
                ListTile(
                  title: const Text('Missions'),
                  onTap: () {
                    getMissions().then((missions) {
                      print(missions);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Missions()));
                    });
                  },
                ),
                ListTile(
                  title: const Text('Parents'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ParentPage()),
                  ),
                ),
                ListTile(
                  title: const Text('Children'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChildrenPage()),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
