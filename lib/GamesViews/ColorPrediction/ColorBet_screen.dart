import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorBetScreen extends StatelessWidget {
  const ColorBetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Fast Parity',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
        )),
        leading: Container(
          decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Icon(Icons.arrow_back_ios),
        ),
        actions: [],
      ),
    );
  }
}
