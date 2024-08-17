import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/cubit/ToDoTasksCubit/AddTaskStates.dart';
import 'package:todo_app/models/TaskModel.dart';

import '../../helper/consts.dart';

class AddTaskCubit extends Cubit<AddTaskStates>{
  AddTaskCubit() : super (AddTaskIntial());

  Color color = kColors[0];
  addTask(TaskModel task) async {
    emit(AddTaskLoading());
    try {
      task.color = color.value;
      await Hive.box<TaskModel>(kTaskesbox).add(task);
      emit(AddTaskSuccess());
    } on Exception catch (e) {
      emit(AddTaskFailure());
    }
  }

}