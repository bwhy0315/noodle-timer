import 'package:flutter/material.dart';

class ProgressWidget extends StatefulWidget {
  final double progress;
  final double strokeWidth;
  final Color strokeColor;
  final Color backgroundColor;

  const ProgressWidget({
    super.key, 
    required this.progress, 
    required this.strokeColor, 
    required this.backgroundColor, 
    required this.strokeWidth
  });

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, width: 300,
      child: CircularProgressIndicator(
        backgroundColor: widget.backgroundColor,
        color: widget.strokeColor,
        value: widget.progress,
        strokeWidth: widget.strokeWidth,
      ),
    );
  }
}