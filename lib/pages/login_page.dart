import 'package:flutter/material.dart';
import 'package:assignment/widgets/text_field.dart';
import 'package:assignment/widgets/login_signup_button.dart';
import 'package:assignment/pages/signup_page.dart';
import 'package:assignment/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTextContoller = TextEditingController();
  final TextEditingController _passwordTextContoller = TextEditingController();
  @override
  Widget build(BuildContext context){
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
            padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0
            ),
            child: Column(
              children: <Widget>[
                Image.asset("images/FilmFlare.png", fit: BoxFit.fitWidth, width: 240, height: 240),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false, _emailTextContoller),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextContoller),
                const SizedBox(
                  height: 20,
                ),
                loginSignupButton(context, true, (){
                  Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const HomePage())
                    );
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
         style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

}