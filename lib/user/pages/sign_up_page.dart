import 'package:flutter/material.dart';
import 'package:swd_project_clatt/user/components/login_signup/my_button.dart';
import 'package:swd_project_clatt/user/components/login_signup/my_textfield.dart';
import 'package:swd_project_clatt/user/components/login_signup/square_tile.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();

  void signUpUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(45, 10, 45, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Create an account',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Let\'s create your account',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                //username texfield
                MyTextField(
                    controller: usernameController,
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    obscureText: false),

                const SizedBox(height: 10),

                //password texfield
                MyTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    obscureText: true),

                const SizedBox(height: 10),

                //re-password texfield
                MyTextField(
                    controller: repasswordController,
                    labelText: 'Re-password',
                    hintText: 'Enter your re-password',
                    obscureText: true),

                const SizedBox(height: 10),

                //fullname textfield
                MyTextField(
                    controller: fullnameController,
                    labelText: 'Fullname',
                    hintText: 'Enter your full name',
                    obscureText: false),

                const SizedBox(height: 10),

                //email textfield
                MyTextField(
                    controller: emailController,
                    labelText: 'Email',
                    hintText: 'Enter your email address',
                    obscureText: false),

                const SizedBox(height: 10),

                MyButton(
                  text: "Sign up",
                  onTap: signUpUser,
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
                        'Sign up with Google',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Login'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
