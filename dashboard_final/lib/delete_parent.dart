// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserDeleter extends StatelessWidget {
  final int userId;

  const UserDeleter(this.userId, {super.key});

  Future<void> _deleteUser() async {
    final url = 'http://localhost:2000/admin/deleteparent';
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode == 200) {
      // handle success case
    } else {
      // handle error case
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _deleteUser,
      child: const Text('Delete User'),
    );
  }
}
