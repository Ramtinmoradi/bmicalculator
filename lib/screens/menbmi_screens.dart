import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator_app/constants/constants.dart';
import 'package:flutter_bmi_calculator_app/widgets/background_shape_left.dart';
import 'package:flutter_bmi_calculator_app/widgets/background_shape_right.dart';

class BMIMen extends StatefulWidget {
  BMIMen({Key? key}) : super(key: key);

  @override
  State<BMIMen> createState() => _BMIMenState();
}

class _BMIMenState extends State<BMIMen> {
  double resultBMI = 0;
  String resultText = '';

  final weightController = TextEditingController();
  final heightController = TextEditingController();
  var imageName = 'Men';

  double widthGood = 100.0;
  double widthBad = 100.0;

  Widget _getTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 150.0,
          height: 50.0,
          child: Center(
            child: TextField(
              controller: weightController,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: 'Weight',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 150.0,
          height: 50.0,
          child: Center(
            child: TextField(
              controller: heightController,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: 'Height',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getCard() {
    return Container(
      width: 300.0,
      height: 80.0,
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                final weight = double.parse(weightController.text);
                final height = double.parse(heightController.text);

                setState(() {
                  resultBMI = weight / (height * height);
                  if (resultBMI > 25) {
                    resultText = 'You are overweight';
                    widthBad = 250.0;
                    widthGood = 50.0;
                    imageName = 'Fatmen';
                  } else if (resultBMI >= 18.5 && resultBMI <= 25) {
                    resultText = 'Your weight is normal';
                    widthBad = 50.0;
                    widthGood = 250.0;
                    imageName = 'Fitmen';
                  } else {
                    resultText = 'You are underweight';
                    widthBad = 120.0;
                    widthGood = 120.0;
                    imageName = 'Underweightmen';
                  }
                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  width: 200.0,
                  height: 50.0,
                  color: blueBackground,
                  child: Center(
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: blueGreenBackground,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                DecoratedBox(
                  position: DecorationPosition.background,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('images/$imageName.png'),
                    ),
                  ),
                  child: Container(width: 350.0, height: 350.0),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Container(
                    width: 392.5,
                    height: 372.9,
                    color: cyanBackground,
                    child: Column(
                      children: [
                        SizedBox(height: 10.0),
                        _getCard(),
                        _getTextField(),
                        SizedBox(height: 10.0),
                        Container(
                          width: 250.0,
                          child: Divider(
                            color: Colors.black,
                            thickness: 1.0,
                          ),
                        ),
                        Text(
                          resultBMI.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          resultText,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RightShape(width: widthBad),
                        SizedBox(height: 10.0),
                        LeftShape(width: widthGood),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
