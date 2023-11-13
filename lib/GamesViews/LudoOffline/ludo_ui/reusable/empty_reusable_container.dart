import 'package:flutter/material.dart';

class ReusableEmptyContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? widget;
  final double? radius;
  final double? margin;
  final bool? isBorder;

  const ReusableEmptyContainer

  ({super.key,
   this.height,
   this.width,
  this.widget,
  this.radius,
  this.margin,
  this.isBorder = true
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(5.0),
      margin:  EdgeInsets.all(margin == null ? 8.0 : margin! ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: isBorder ==  true ? Border.all(color: Colors.amber, width: 2): null,
        gradient: const RadialGradient(
          colors: [
            Color(0xFF4285F4),
            Color(0xFF173375),
            Color(0xFF173375),
            Color(0xFF001665),
          ],
        ),
        borderRadius:  BorderRadius.circular( radius == null ?  10.0 :  radius!) ,
      ),
      child
      :widget,
    );
  }
}