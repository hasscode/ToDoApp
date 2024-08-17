import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/cubit/ToDoTasksCubit/ShowTaskStates.dart';
import 'package:todo_app/helper/consts.dart';
import 'package:todo_app/models/TaskModel.dart';

class ShowTasksCubit extends Cubit<ShowTasksStates>{
  ShowTasksCubit(): super(ShowTasksInitial());
bool isdone=false;
  List<TaskModel> tasks = [];
  showTask() {
    tasks = Hive.box<TaskModel>(kTaskesbox).values.toList();
    emit(ShowTasksSuccess());
  }
}