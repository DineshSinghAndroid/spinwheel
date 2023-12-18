import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container ContainerWithBorder(
    {Widget? widget,
    color,
    height,
    width,
    borderColor,
    borderRadius,
    verticalPadding,
    verticalmargin,
    horizontalmargin,
    horizontalPadding}) {
  return Container(
    height: height,
    padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 1.0,
        vertical: verticalPadding ?? 1.0),
    margin: EdgeInsets.symmetric(
        horizontal: horizontalmargin ?? 0.0, vertical: verticalmargin ?? 0.0),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: color ?? Colors.white,
        border: Border.all(
            width: width ?? 0.4, color: borderColor ?? Colors.black)),
    child: widget,
  );
}
