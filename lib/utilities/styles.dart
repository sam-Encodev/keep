import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dots_indicator/dots_indicator.dart';

const standardSpacing = 10.0;

const spacing = 8.0;

const minFont = 17.0;
const maxFont = 50.0;
const labelSize = 15.0;
const errorFont = 12.0;

const formIcons = 30.0;
const maxIcons = 35.0;
const standardIcon = 25.0;
const standardFont = 20.0;

const inputRadius = 25.0;
const buttonRadius = 20.0;
const maxButtonRadius = 50.0;
const iconButtonRadius = 10.0;

const minButton = 20.0;
const maxButton = 40.0;

const buttonWidth = 50.0;
const maxButtonWidth = 100.0;

const maxHeight = 50.0;
const minHeight = 20.0;

iconButtonStyle(context) {
  return ButtonStyle(
      backgroundColor:
          WidgetStateProperty.all(Theme.of(context).colorScheme.surface),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(iconButtonRadius),
        ),
      ));
}

maxIconButtonStyle(context) {
  return ButtonStyle(
      backgroundColor:
          WidgetStateProperty.all(Theme.of(context).colorScheme.tertiary),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(maxButtonRadius),
        ),
      ));
}

buttonStyle(context, {size = "medium"}) {
  var type = size == "medium" ? 50.0 : 40.0;
  return ButtonStyle(
    backgroundColor:
        WidgetStateProperty.all(Theme.of(context).colorScheme.tertiary),
    minimumSize: WidgetStateProperty.all(Size(double.infinity, type)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(buttonRadius),
      ),
    ),
  );
}

textButtonStyle(context) {
  return ButtonStyle(
    backgroundColor:
        WidgetStateProperty.all(Theme.of(context).colorScheme.tertiary),
    minimumSize: WidgetStateProperty.all(Size(maxButtonWidth, double.minPositive)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(buttonRadius),
      ),
    ),
  );
}

inputBorder(context) {
  //return type is OutlineInputBorder
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(inputRadius),
    borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
  );
}

focusBorder(context) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(inputRadius),
    borderSide: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
  );
}

errorBorder(context) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(inputRadius),
    borderSide: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
  );
}

errorStyle(context) {
  return TextStyle(
    fontSize: errorFont,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.tertiary,
  );
}

dotsStyle(context) {
  return DotsDecorator(
    color: Theme.of(context).colorScheme.outlineVariant,
    size: const Size(10.0, 5.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(inputRadius),
    ),
    activeSize: const Size(22.0, 5.0),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(inputRadius),
    ),
    activeColor: Theme.of(context).colorScheme.primary,
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

buildText(String data, context, {height = 0.0}) {
  return Text(
    data,
    style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: standardFont,
        height: height),
  );
}
