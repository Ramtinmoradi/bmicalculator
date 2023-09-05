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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              Text(
                'Select Your Gender',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(250.0, 50.0),
                  backgroundColor: blueGreenBackground,
                ),
                onPressed: () {
                  navigateTo(
                    context,
                    BMIMen(),
                  );
                },
                child: Center(
                  child: Text(
                    'Male',
                    style: TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(250.0, 50.0),
                  backgroundColor: blueGreenBackground,
                ),
                onPressed: () {
                  navigateTo(context, BMIWomen());
                },
                child: Center(
                  child: Text(
                    'Female',
                    style: TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
