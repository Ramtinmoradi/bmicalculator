import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator_app/screens/home_screens.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'dm'),
      home: HomeScreen(),
    );
  }
}
