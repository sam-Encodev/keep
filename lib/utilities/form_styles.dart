import 'package:flutter/material.dart';

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
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.redAccent,
  );
}
