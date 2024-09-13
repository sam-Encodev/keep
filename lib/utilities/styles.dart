import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dots_indicator/dots_indicator.dart';

const spacing = 8.0;
const padding = 10.0;

iconButtonStyle() {
  return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Colors.black87),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ));
}

buttonStyle({color = Colors.white}) {
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.all(color),
    minimumSize: WidgetStateProperty.all(const Size(double.infinity, 40)),
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}

inputBorder() {
  //return type is OutlineInputBorder
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(25.0),
    borderSide: const BorderSide(color: Colors.black12),
  );
}

focusBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(25.0),
    borderSide: const BorderSide(color: Colors.black54),
  );
}

errorBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(25.0),
    borderSide: const BorderSide(color: Colors.black54),
  );
}

errorStyle() {
  return const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.redAccent,
  );
}

dotsStyle() {
  return DotsDecorator(
    color: const Color(0xFFBDBDBD),
    size: const Size(10.0, 5.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    activeSize: const Size(22.0, 5.0),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    spacing: const EdgeInsets.all(2.0),
  );
}

transportInputBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  );
}

transparentFocusedBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  );
}

transparentErrorBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  );
}

transparentEnabledBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  );
}

buildSVG(String assetName) {
  return SvgPicture.asset(
    width: 70,
    height: 250,
    'assets/svg/$assetName',
    semanticsLabel: assetName,
    key: UniqueKey(),
  );
}

buildText(String data) {
  return Text(
    data,
    style: const TextStyle(color: Colors.white, fontSize: 20),
  );
}
