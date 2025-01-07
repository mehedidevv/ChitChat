
import 'package:flutter/material.dart';

const ktittleTextStyle=TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
);

final kBoxDecoration= BoxDecoration(
  color: Colors.blue, // Set the background color here
  border: Border.all(color: Colors.black, width: 2), // Add other decorations
  borderRadius: BorderRadius.circular(20),
);

final kInputDecoration=InputDecoration(
    //hintText: 'Enter Your Password',
    contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Colors.blue),
    ),
);


final kButtonInputDecoration=InputDecoration(
  //hintText: 'Enter Your Password',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.blue),
  ),
);


