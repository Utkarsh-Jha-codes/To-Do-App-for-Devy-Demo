import 'package:flutter/material.dart';
import 'package:to_do/Pages/AddTask.dart';
import 'package:to_do/Pages/Login.dart';
import 'package:to_do/Pages/MainList.dart';
import 'package:to_do/Pages/SignIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/login": (context) => const Login(),
        "/home": (context) => const listPage(),
        "/addTask": (context) => const AddTask(),
        "/SignIn": (context) => const SignIn(),
      },
    );
  }
}
