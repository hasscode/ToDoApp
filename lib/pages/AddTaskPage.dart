import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/ToDoTasksCubit/AddTaskCubit.dart';
import 'package:todo_app/cubit/ToDoTasksCubit/ShowTasksCubit.dart';
import '../cubit/ToDoTasksCubit/AddTaskStates.dart';
import '../cubit/appthemecubit/app_theme_cubit.dart';
import '../widgets/AddTaskForm.dart';
class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Add Task',
              style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 28,
                  color: BlocProvider.of<AppThemeCubit>(context).appbartheme),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                CupertinoIcons.back,
                size: 35,
                color: BlocProvider.of<AppThemeCubit>(context).appbartheme,
              ),
            ),
          ),
          body: BlocConsumer<AddTaskCubit, AddTaskStates>(
              builder: (context, state) {
                return AddTaskForm();
              }, listener: (context, state) {
            if (state is AddTaskFailure) {
              print('failed');
            }
            if (state is AddTaskSuccess) {
              BlocProvider.of<ShowTasksCubit>(context).showTask();
              Navigator.pop(context);
            }
          })),
    );
  }
}
