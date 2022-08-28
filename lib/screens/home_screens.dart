import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator_app/constants/constants.dart';
import 'package:flutter_bmi_calculator_app/widgets/background_shape_left.dart';
import 'package:flutter_bmi_calculator_app/widgets/background_shape_right.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double resultBMI = 0;
  String resultText = '';

  final weightController = TextEditingController();
  final heightController = TextEditingController();

  double widthGood = 100.0;
  double widthBad = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'BMI محاسبه ',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130.0,
                  child: TextField(
                    controller: weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26.0,
                      color: redBackground,
                    ),
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'وزن',
                      hintStyle: TextStyle(
                        color: redBackground.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130.0,
                  child: TextField(
                    controller: heightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26.0,
                      color: redBackground,
                    ),
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'قد',
                      hintStyle: TextStyle(
                        color: redBackground.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.0),
            InkWell(
              onTap: () {
                final weight = double.parse(weightController.text);
                final height = double.parse(heightController.text);

                setState(() {
                  resultBMI = weight / (height * height);
                  if (resultBMI > 25) {
                    resultText = 'شما اضافه وزن دارید';
                    widthBad = 250.0;
                    widthGood = 50.0;
                  } else if (resultBMI >= 18.5 && resultBMI <= 25) {
                    resultText = 'وزن شما نرمال است';
                    widthBad = 50.0;
                    widthGood = 250.0;
                  } else {
                    resultText = 'شما کمبود وزن دارید';
                    widthBad = 120.0;
                    widthGood = 120.0;
                  }
                });
              },
              child: Text(
                'محاسبه کن',
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Text(
              resultBMI.toStringAsFixed(2),
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(height: 40.0),
            Text(
              resultText,
              style: TextStyle(
                fontSize: 20.0,
                color: redBackground,
              ),
            ),
            SizedBox(height: 80.0),
            RightShape(width: widthBad),
            SizedBox(height: 15),
            LeftShape(width: widthGood),
          ],
        ),
      ),
    );
  }
}
