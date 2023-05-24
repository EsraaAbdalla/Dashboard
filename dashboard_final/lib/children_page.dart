// ignore_for_file: unused_field, unnecessary_brace_in_string_interps, prefer_typing_uninitialized_variables, avoid_print, prefer_const_declarations

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ChildrenPage extends StatefulWidget {
  const ChildrenPage({super.key});

  @override
  State<ChildrenPage> createState() => _ChildrenPageState();
}

class _ChildrenPageState extends State<ChildrenPage> {
  final List<int> _itemList = List<int>.generate(60, (index) => index);
  var jsonList;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> _deleteChild(id) async {
    print(id);
    final url =
        'https://graduation-project-svct.onrender.com/admin/deletechild';
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
        "https://graduation-project-svct.onrender.com/admin/allchilds"));
    if (response.statusCode == 200) {
      setState(() {
        var newData = json.decode(response.body);
        print(newData);
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
        title: const Text("All Children🥰"),
      ),
      body: ReorderableListView.builder(
          itemBuilder: (BuildContext context, int index) {
            var gender = jsonList[index]['childGender'];
            print(gender);
            return Card(
              key: Key('${index}'),
              child: ListTile(
                leading: gender == "male"
                    ? Image.asset('images/male.png')
                    : Image.asset('images/female.png'),
                title: Text(jsonList[index]['childName']),
                subtitle: Text(jsonList[index]['childGender']),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _deleteChild(jsonList[index]["_id"]);

                    setState(() {
                      jsonList.removeAt(index);
                    });
                  },
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
