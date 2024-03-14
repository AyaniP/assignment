import 'package:flutter/material.dart';
import 'package:assignment/widgets/text_field.dart';
import 'package:assignment/widgets/login_signup_button.dart';
import 'package:assignment/pages/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final TextEditingController _userNameTextContoller = TextEditingController();
  final TextEditingController _emailTextContoller = TextEditingController();
  final TextEditingController _passwordTextContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.cyan, 
              Colors.blueGrey, 
              Colors.indigo
            ], 
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
          )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20, 120, 20, 0
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false, _userNameTextContoller),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Address", Icons.person_outline, false, _emailTextContoller),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextContoller),
                loginSignupButton(context, false, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage())
                  ); 
                })
              ],
            ),
          ),
        ),
      ),
    );
  } 
}