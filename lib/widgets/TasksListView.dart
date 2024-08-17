import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/ToDoTasksCubit/ShowTaskStates.dart';
import 'package:todo_app/cubit/ToDoTasksCubit/ShowTasksCubit.dart';
import 'package:todo_app/widgets/ToDoItem.dart';
class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShowTasksCubit>(context).showTask();
    return BlocBuilder<ShowTasksCubit,ShowTasksStates>(builder: (context,state){
      return Expanded(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: BlocProvider.of<ShowTasksCubit>(context).tasks.length,
            itemBuilder: (context, i) {
              return ToDoItem(
                  taskModel: BlocProvider.of<ShowTasksCubit>(context).tasks[i]);
            }),
      );
    });
  }
}
