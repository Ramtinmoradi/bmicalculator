import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator_app/constants/constants.dart';

class LeftShape extends StatelessWidget {
  final double width;
  const LeftShape({Key? key, this.width = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 40.0,
          width: width,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        SizedBox(width: 5),
        Text(
          'Positive index',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
