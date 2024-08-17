import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/ToDoTasksCubit/AddTaskCubit.dart';
import 'package:todo_app/widgets/ColorItem.dart';

import '../helper/consts.dart';
class TaskColorList extends StatefulWidget {
  const TaskColorList({super.key});

  @override
  State<TaskColorList> createState() => _TaskColorListState();
}

class _TaskColorListState extends State<TaskColorList> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
          height: 2 * 30,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: kColors.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedindex = i;
                        BlocProvider.of<AddTaskCubit>(context).color =
                        kColors[i];
                      });
                    },
                    child: ColorItem(
                      isActive: selectedindex == i,
                      color: kColors[i],
                    ));
              })),
    );;
  }
}
