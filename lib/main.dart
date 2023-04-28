import 'package:flutter/material.dart';
import 'package:maphidol/screen/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Maphidol',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage());
  }
}
