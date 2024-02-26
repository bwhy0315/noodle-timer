import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class RoudedButton extends StatelessWidget {
  final IconData icon;

  const RoudedButton({
    Key? key, 
    required this.icon,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      child: Icon(icon, size: 36,),
    ).pSymmetric(h: 5);
  }
}
