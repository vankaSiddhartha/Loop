import 'package:flutter/material.dart';
import 'package:loop/constants.dart';
import 'package:loop/view/screens/auth/sign_in.dart';
import 'package:loop/view/screens/auth/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor
      ),
      home: SignUp(),
    );
  }
}
