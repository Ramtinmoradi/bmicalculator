import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator_app/constants/constants.dart';
import 'package:flutter_bmi_calculator_app/screens/menbmi_screens.dart';
import 'package:flutter_bmi_calculator_app/screens/womenbmi_screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void navigateTo(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGreenBackground,
        elevation: 0.0,
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300.0,
              child: Image(
                image: AssetImage('images/FirstPage.png'),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Select Your Gender',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: 200.0,
              height: 40.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueGreenBackground,
                ),
                onPressed: () {
                  navigateTo(context, BMIMen());
                },
                child: Text(
                  'Male',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              width: 200.0,
              height: 40.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueGreenBackground,
                ),
                onPressed: () {
                  navigateTo(context, BMIWomen());
                },
                child: Text(
                  'Female',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
