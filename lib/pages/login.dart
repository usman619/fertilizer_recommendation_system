import 'package:fertilizer_recommendation_system/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
            const SizedBox(height: 20,),
            const Text(
              'Welcome',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 60),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(

                  border: OutlineInputBorder(),
                  labelText: 'Enter your username'
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(20),
              child: TextField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your password'
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: TextButton(
                // Login to the account
                onPressed: () async {
                  try {
                    final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                      email: _email.text,
                      password: _password.text,
                    );
                    final User? user = userCredential.user;
                    if (user != null) {
                      // Navigate to the home screen
                      // ignore: use_build_context_synchronously
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
                    // Handle sign in errors
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
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        return Colors.blue;
                      }
                  ),
                  minimumSize: MaterialStateProperty.resolveWith<Size?>(
                          (Set<MaterialState> states) {
                        return const Size.fromHeight(50);
                      }
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            // Register new user button
            Container(
              margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/register');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        return Colors.blue;
                      }
                  ),
                  minimumSize: MaterialStateProperty.resolveWith<Size?>(
                          (Set<MaterialState> states) {
                        return const Size.fromHeight(50);
                      }
                  ),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
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
