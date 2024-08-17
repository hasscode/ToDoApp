import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color kPrimaryColor = const Color(0xffD4ECED);
Color kPrimaryColorDark = const Color(0xff191919);
Color kSecondryColor = const Color(0xff00978E);
Color kSecondryColorDark = const Color(0xff00322F);

SharedPreferences? sharedPreferences;
String knotesbox = 'notes_box';
String kTaskesbox = 'tasks_box';
List kColors = const [
  Color(0xff407EA2),
  Color(0xff19558B),
  Colors.redAccent,
  Color(0xff03A65A),
  Colors.orangeAccent,
  Color(0xff919151),
  Colors.grey,
  Color(0xffFF81D0),
  Color(0xff5021B4),
];
