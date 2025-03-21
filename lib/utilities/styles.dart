import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dots_indicator/dots_indicator.dart';

const standardSpacing = 10.0;

const spacing = 8.0;
const minSpacing = 5.0;
const seSpacing = 2.0;

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
const maxButtonWidth = 120.0;

const maxHeight = 50.0;
const midHeight = 30.0;
const minHeight = 20.0;

const displayLarge = 57.0;
const displayMedium = 45.0;
const displaySmall = 36.0;

const headlineLarge = 32.0;
const headlineMedium = 28.0;
const headlineSmall = 24.0;

const titleLarge = 22.0;
const titleMedium = 16.0;
const titleSmall = 14.0;

const bodyLarge = 16.0;
const bodyMedium = 14.0;
const bodySmall = 12.0;

const labelLarge = 14.0;
const labelMedium = 12.0;
const labelSmall = 11.0;

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
          WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(maxButtonRadius),
        ),
      ));
}

buttonStyle(context, {size = "medium"}) {
  var type = size == "medium" ? 50.0 : 40.0;
  return ButtonStyle(
    minimumSize: WidgetStateProperty.all(Size(double.infinity, type)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(buttonRadius),
      ),
    ),
  );
}

textButtonStyle(context, {type = "primary"}) {
  return ButtonStyle(
    backgroundColor: type == "primary"
        ? WidgetStateProperty.all(Theme.of(context).colorScheme.primary)
        : null,
    minimumSize: WidgetStateProperty.all(Size(maxButtonWidth, maxHeight)),
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
    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
  );
}

errorBorder(context) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(inputRadius),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
  );
}

errorStyle(context) {
  return TextStyle(
    fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.error,
  );
}

inputFillColor(context) {
  return Theme.of(context).colorScheme.onError;
}

dotsStyle(context) {
  return DotsDecorator(
    color: Theme.of(context).colorScheme.outline,
    size: const Size(standardSpacing, minSpacing),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(inputRadius),
    ),
    activeSize: const Size(22.0, minSpacing),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(inputRadius),
    ),
    activeColor: Theme.of(context).colorScheme.primary,
    spacing: const EdgeInsets.all(seSpacing),
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

hintStyle(context) {
  return TextStyle(color: Theme.of(context).colorScheme.outline);
}