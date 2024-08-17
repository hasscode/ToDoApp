import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/TaskModel.dart';

import '../cubit/ToDoTasksCubit/ShowTasksCubit.dart';
import '../cubit/appthemecubit/app_theme_cubit.dart';
class ShowTaskContentPage extends StatelessWidget {
 ShowTaskContentPage({super.key,required this.taskModel});
  TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          taskModel.title,
          style: TextStyle(
              fontSize: 30,
              color: BlocProvider.of<AppThemeCubit>(context).appbartheme,
              fontFamily: 'Oswald'),
        ),
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
        actions: [
          IconButton(
            onPressed: () {
              taskModel.delete();
              BlocProvider.of<ShowTasksCubit>(context).showTask();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.delete,
              size: 35,
              color: BlocProvider.of<AppThemeCubit>(context).appbartheme,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              taskModel.content,
              style: TextStyle(
                fontSize: 20,
                color: BlocProvider.of<AppThemeCubit>(context).appbartheme,
              ),
            ),
          ),
          BlocProvider.of<ShowTasksCubit>(context).isdone?Center(
            child: Text(
              "Completed",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontFamily: 'RubikVinyl',fontWeight: FontWeight.bold),
            ),
          ):Text('')
        ],
      ),
    );
  }
}
