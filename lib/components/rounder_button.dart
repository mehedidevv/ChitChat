
import 'package:flutter/material.dart';

import 'constants.dart';

//TODO After Refactoring Gesture Detector Widget
class RoundedButton extends StatelessWidget {

  final String tittle;
  final VoidCallback onTap;

  RoundedButton({this.tittle='',required this.onTap}){}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: kBoxDecoration,

        height: 50.0,
        width: double.infinity,
        child:  Center(
          child: Text(tittle,
            style: TextStyle(
              fontSize: 20.0,
            ),),
        ),
      ),
    );
  }
}