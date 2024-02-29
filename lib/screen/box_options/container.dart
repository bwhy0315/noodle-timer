import 'package:flutter/material.dart';

// Usage
const height10 = BoxHeight(10);
const height5 = BoxHeight(5);

const width10 = BoxWidth(10);
const width5 = BoxWidth(5);


Widget rowLine = Container(
  height: 1.0,
  width: 500.0,
  color: Colors.grey,
);

class BoxHeight extends SizedBox {
  const BoxHeight(double value, {super.key}) : super(height: value);
}

class BoxWidth extends SizedBox {
  const BoxWidth(double value, {super.key}) : super(width: value);
}