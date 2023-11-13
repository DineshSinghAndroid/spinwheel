import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress;
  final double width;

  const CustomProgressBar({super.key, required this.progress,required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: width,// Adjust the height as needed
      decoration: BoxDecoration(
        color: Colors.black, // Background color
        borderRadius: BorderRadius.circular(2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,heightFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.yellow, // Progress color
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}
