import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator_app/constants/constants.dart';

class RightShape extends StatelessWidget {
  final double width;
  const RightShape({Key? key, this.width = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Negative index',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(width: 5),
        Container(
          height: 40.0,
          width: width,
          decoration: BoxDecoration(
            color: redBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
