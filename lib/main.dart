import 'package:flutter/material.dart';
import 'package:assignment/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey,
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

