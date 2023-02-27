import 'package:flutter/material.dart';
import 'package:swd_project_clatt/components/login_signup/my_button.dart';
import 'package:swd_project_clatt/components/login_signup/my_textfield.dart';
import 'package:swd_project_clatt/components/login_signup/square_tile.dart';
import 'package:swd_project_clatt/pages/sign_up_page.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
          child: SafeArea(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                //logo
                Image.asset(
                  'lib/images/logo.png',
                  height: 200,
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

                //username textfield
                MyTextField(
                    controller: usernameController,
                    labelText: 'Username',
                    hintText: 'Username',
                    obscureText: false),

                const SizedBox(height: 10),

                //password texfield
                MyTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    hintText: 'Password',
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

                MyButton(
                  text: "Sign in",
                  onTap: signUserIn,
                ),

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
                      const SquareTile(imagePath: 'lib/images/google.png'),
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
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: const Text('Register now'),
                    ),
                  ],
                )
              ],
            ),
          )),
        ));
  }
}
