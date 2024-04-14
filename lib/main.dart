import 'package:flutter/material.dart';
import 'package:reservationapp/Signup/Screen/Signup%20page.dart';

import 'Login/Screen/Login page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: SignupPage()
    );
  }
}
