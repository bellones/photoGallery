import 'package:flutter/material.dart';

import 'size_config.dart';

const kPrimaryColor = Color(0xFF0089FF);
const kOrange = Color.fromRGBO(255, 61, 61, 1);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF0089FF), Color(0xFF434CFF)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

const photoUrl = 'https://jsonplaceholder.typicode.com/photos';
