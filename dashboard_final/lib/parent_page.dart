// ignore_for_file: unused_field, unnecessary_brace_in_string_interps, prefer_typing_uninitialized_variables, avoid_print, unused_element, prefer_const_declarations

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ParentPage extends StatefulWidget {
  const ParentPage({super.key});

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  // delete() async {
  //   var res = await http.get('http://localhost:2000/admin/deleteparent' as Uri);
  //   if (res.statusCode == 200) {
  //     var jsonObj = json.decode(res.body);
  //     return jsonObj['result'];
  //   }
  // }

  final List<int> _itemList = List<int>.generate(60, (index) => index);
  var jsonList;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> _deleteParent(id) async {
    print(id);
    final url =
        'https://graduation-project-svct.onrender.com/admin/deleteparent';
    final body = json.encode({"Id": id});
    print(body);

    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'}, body: body);
    if (response.statusCode == 200) {
      getData();
      print(response.body);
    } else {
      print("A network error occurred");
    }
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        "https://graduation-project-svct.onrender.com/admin/allparents"));

    if (response.statusCode == 200) {
      setState(() {
        var newData = json.decode(response.body);
        jsonList = newData as List;
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Parents👨‍👦"),
      ),
      body: ReorderableListView.builder(
          itemBuilder: (BuildContext context, int index) {
            var gender = jsonList[index]['gender'];
            return Card(
              // color: Colors.deepOrange,
              key: Key('${index}'),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  leading: gender != "male"
                      ? Image.asset('images/mother.jpeg')
                      : Image.asset('images/father.png'),
                  title: Text(jsonList[index]['email']),
                  subtitle: Text(jsonList[index]['gender']),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _deleteParent(jsonList[index]["_id"]);

                      setState(() {
                        jsonList.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
            );
          },
          itemCount: jsonList == null ? 0 : jsonList.length,
          onReorder: ((int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final int tmp = jsonList[oldIndex];
              jsonList.removeAt(oldIndex);
              jsonList.insert(newIndex, tmp);
            });
          })),
    );
  }
}
