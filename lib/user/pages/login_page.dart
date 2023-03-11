import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swd_project_clatt/common/constants.dart';
import 'package:http/http.dart' as http;
import 'package:swd_project_clatt/services/login_api.dart';
import 'package:swd_project_clatt/user/components/login_signup/my_textfield.dart';
import 'package:swd_project_clatt/user/components/login_signup/square_tile.dart';
import 'package:swd_project_clatt/user/pages/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //sign user
  Future<void> _handleLogin(
      BuildContext context, String username, String password) async {
    // Call an authentication API using the http package
    final response = await http.post(
      Uri.parse('$BASE_URL/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'password': password}),
    );
    if (response.statusCode == 202) {
      final Map<String, dynamic> responseData =
          json.decode(response.body.toString());
      final data = responseData['data'];
      final token = data['accessToken'];
      Provider.of<Auth>(context, listen: false).setToken(token);
      Navigator.pushReplacementNamed(context, '/screen');
    } else {
      // Display an error message if the login is unsuccessful
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Invalid username or password'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: SafeArea(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),

                  //logo
                  Image.asset(
                    'assets/images/iClean.png',
                    height: 250,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          //username textfield
                          MyTextField(
                              controller: _usernameController,
                              labelText: 'Username',
                              hintText: 'Username',
                              text: 'Username',
                              obscureText: false),

                          const SizedBox(height: 10),

                          //password texfield
                          MyTextField(
                              controller: _passwordController,
                              labelText: 'Password',
                              hintText: 'Password',
                              text: 'Password',
                              obscureText: true),

                          const SizedBox(height: 10),

                          //Forgot password
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 10),

                          // MyButton(
                          //   text: "Sign in",
                          //   onTap: _submit,
                          // ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 6,
                              backgroundColor: Colors.deepPurple.shade300,
                              padding: const EdgeInsets.fromLTRB(130,20,130,20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _handleLogin(
                                  context,
                                  _usernameController.text,
                                  _passwordController.text,
                                );
                              }
                            },
                            child: Text('Login'),
                          ),
                        ],
                      )),

                  const SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SquareTile(imagePath: "assets/images/google.png"),
                        Text(
                          'Login with Google',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextButton(
                        style: ElevatedButton.styleFrom(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                          );
                        },
                        child: const Text('Register now'),
                      ),
                    ],
                  )
                ],
              ),
            )),
          ),
        ));
  }
}
