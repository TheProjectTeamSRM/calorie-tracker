import 'package:flutter/material.dart';


InputDecoration kInputDecoration = InputDecoration(
    labelText: 'E-mail',
    labelStyle: TextStyle(
      fontFamily: 'Monserrat',
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green)
    )
);


const kBottomContainerHeight = 80.0;
const kActiveCardColour = Color(0xFF1D1E33);
const kInactiveCardColour = Color(0xFF111328);
const kBottomContainerColour = Color(0xFFEB1555);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  color: Colors.white
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
  color: Colors.white
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
  color: Colors.grey
);
