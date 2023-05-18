import 'package:fertilizer_recommendation_system/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,

      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15,),
            const Text(
              'Welcome',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(

                  border: OutlineInputBorder(),
                  labelText: 'Enter your Email'
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                controller: _password,
                obscureText: obscurePassword,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Enter your Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    icon: Icon(
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),

            // Login user button
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8),
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                          email: _email.text,
                          password: _password.text,
                        );
                        final User? user = userCredential.user;
                        if (user != null) {

                          Navigator.pushNamed(context, '/home');

                          Fluttertoast.showToast(
                            msg: "Successfully Logged In",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      } catch (e) {
                        print(e);
                        Fluttertoast.showToast(
                          msg: "Unable to login",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

            // Register new user button
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
