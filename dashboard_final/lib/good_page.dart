// ignore_for_file: unused_field, unnecessary_brace_in_string_interps, prefer_typing_uninitialized_variables, avoid_print, unused_import

import 'dart:convert';

import 'package:dashboard_final/dashboard.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class GoodPage extends StatefulWidget {
  const GoodPage({super.key});

  @override
  State<GoodPage> createState() => _GoodPageState();
}

class _GoodPageState extends State<GoodPage> {
  final List<int> _itemList = List<int>.generate(60, (index) => index);
  // List<dynamic> nameAndUrlList = missions[0]['missions']['planet1'];

  @override
  void initState() {
    super.initState();
    // getMissions();
    // print(missions[0][""]);
    //   print(nameAndUrlList);
  }

  @override
  Widget build(BuildContext context) {
    // print(missions[0]['missions']['planet1'][0]['URL']);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Missions"),
      // ),
      body: ReorderableListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              // color: Colors.deepOrange,
              key: Key('${index}'),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),

                  leading: Image.network("${missions[index]['URL']}"),
                  title: Text(
                    '${missions[index]['NAME']}',
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  // trailing: IconButton(
                  //   icon: const Icon(Icons.delete),
                  //   onPressed: () {
                  //     setState(() {
                  //       missions.removeAt(index);
                  //     });
                  //   },
                  // ),
                ),
              ),
            );
          },
          itemCount: missions == null ? 0 : missions.length - 12,
          onReorder: ((int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final int tmp = missions[oldIndex];
              missions.removeAt(oldIndex);
              missions.insert(newIndex, tmp);
            });
          })),
    );
  }
}
