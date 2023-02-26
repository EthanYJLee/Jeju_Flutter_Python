import 'package:flutter/material.dart';
import 'package:jeju_app/view/login.dart';
import 'package:jeju_app/view/search_id.dart';
import 'package:jeju_app/view/search_pw.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          primaryColorDark: Color.fromARGB(207, 195, 172, 152),
          primaryColorLight: Color.fromARGB(197, 226, 218, 210),
          fontFamily: 'text'),
      debugShowCheckedModeBanner: false,
      home: const Login(),
    );
  }
}
