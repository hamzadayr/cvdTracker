import 'package:flutter/material.dart';
class TabItm {
  IconData icon;
  String title;
  Color circleColor;
  TextStyle labelStyle;

  TabItm(this.icon, this.title, this.circleColor, {this.labelStyle = const TextStyle(fontWeight: FontWeight.bold)});
}