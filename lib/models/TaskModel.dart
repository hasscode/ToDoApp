
import 'package:hive/hive.dart';
part 'TaskModel.g.dart';
@HiveType(typeId: 1)
class TaskModel extends HiveObject{
  TaskModel({required this.title,required this.date,required this.content ,required this.fromDate,required this.toDate,required this.color,required this.isdone});
@HiveField(0)
  String title ;
  @HiveField(1)
String content ;
  @HiveField(2)
String date ;
  @HiveField(3)
String fromDate;
  @HiveField(4)
String toDate;
  @HiveField(5)
  int color;
  @HiveField(6)
  bool isdone ;

}