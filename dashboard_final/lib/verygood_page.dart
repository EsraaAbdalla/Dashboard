// ignore_for_file: unused_field, unnecessary_brace_in_string_interps, prefer_typing_uninitialized_variables, avoid_print, unused_import, unnecessary_null_comparison

import 'dart:convert';

import 'package:dashboard_final/dashboard.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

List<dynamic> newArray = missions.sublist(12);

class VeryGoodPage extends StatefulWidget {
  const VeryGoodPage({super.key});

  @override
  State<VeryGoodPage> createState() => _VeryGoodPageState();
}

class _VeryGoodPageState extends State<VeryGoodPage> {
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

                  leading: Image.network("${newArray[index]['URL']}"),
                  title: Text(
                    '${newArray[index]['NAME']}',
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  // trailing: IconButton(
                  //   icon: const Icon(Icons.delete),
                  //   onPressed: () {
                  //     setState(() {
                  //       newArray.removeAt(index);
                  //     });
                  //   },
                  // ),
                ),
              ),
            );
          },
          itemCount: newArray == null ? 0 : newArray.length,
          onReorder: ((int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final String tmp = newArray[oldIndex];
              newArray.removeAt(oldIndex);
              newArray.insert(newIndex, tmp);
            });
          })),
    );
  }
}
