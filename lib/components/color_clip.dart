import 'package:flutter/material.dart';
import 'package:keep/utilities/switch_color.dart';

colorClip(value) {
  return ClipOval(
      child: Container(height: 30, width: 30, color: SwitchColor.color(value)));
}
