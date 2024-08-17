import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'NoteModel.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  int color = Colors.greenAccent.value;
  @HiveField(3)
  String date = DateTime.now().toString();
  NoteModel(
      {required this.color,
      required this.date,
      required this.subtitle,
      required this.title});
}
