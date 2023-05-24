// ignore_for_file: non_constant_identifier_names, prefer_const_declarations, use_build_context_synchronously, avoid_print, unnecessary_null_comparison, unused_import, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps, file_names

import 'dart:convert';

import 'package:dashboard_final/dashboard.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart ' as http;

var token;
var parentId;
var jsonList;
var user;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool obsecuretext = true;
  var formkey2 = GlobalKey<FormState>();
  dynamic responseData;
  Future<void> _Login() async {
    final url = 'https://graduation-project-svct.onrender.com/admin/login';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );
    print(response.body);
    responseData = json.decode(response.body);
    print(responseData);

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashBoard()),
      );

      // final prefs = await SharedPreferences.getInstance();
      // prefs.setString('token', responseData['token']);
      // token = responseData['token'];
      // parentId = responseData['parentId'];
      // print('${responseData['token']}');
      print('tmaaaam');
    } else {
      print('مش تماااام');
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text("create account")),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey2,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/admin.jpg"), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        // IconButton(
                        //   onPressed: () {
                        //     Navigator.pop(context);
                        //   },
                        //   icon: const Icon(
                        //     color: Colors.white,
                        //     Icons.keyboard_arrow_left,
                        //   ),
                        // ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Center(
                          child: Text(
                            'Login As Admin',
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {},
                      /* onChanged: (value) {
                        print(value);
                      },*/
                      decoration: InputDecoration(
                        fillColor: Colors.white38.withOpacity(0.9),
                        filled: true,
                        // hinttext disappered when i start writting
                        labelText: 'Email Address',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      controller: passwordController,
                      keyboardType: TextInputType.phone,
                      obscureText: obsecuretext,
                      onFieldSubmitted: (value) {},
                      /*onChanged: (value){
                        print(value);
                      },*/
                      decoration: InputDecoration(
                        fillColor: Colors.white38.withOpacity(0.9),
                        filled: true,
                        // hint text disappered when i start writting
                        labelText: 'password',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),

                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obsecuretext = !obsecuretext;
                            });
                          },
                          child: Icon(obsecuretext
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formkey2.currentState!.validate()) {
                              _Login();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.grey,
                          ),
                          child: const Text('Login'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
