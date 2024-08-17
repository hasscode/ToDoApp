import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/widgets/TaskColorList.dart';
import '../cubit/ToDoTasksCubit/AddTaskCubit.dart';
import '../cubit/ToDoTasksCubit/ShowTasksCubit.dart';
import '../cubit/appthemecubit/app_theme_cubit.dart';
import '../models/TaskModel.dart';
import 'CustomButton.dart';
import 'CustomTextFormField.dart';
class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formkey,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Title',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Oswald',
                  color: BlocProvider.of<AppThemeCubit>(context).appbartheme),
            ),
          ),
          CustomTextFormField(
            onChanged: (j) {},
            hinttext: 'write title here',
            maxline: 1,
            onSaved: (val) {
              title = val;
            },
          ),
          CustomTextFormField(

            onChanged: (j) {},
            hinttext: 'write note here',
            maxline: 1,
            onSaved: (val) {
              content = val;
            },
          ),
TaskColorList(),
          CustomButton(
            height: 60,
            symmetricHoizontalPadding: 25,
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                BlocProvider.of<AddTaskCubit>(context).addTask(TaskModel(
                  fromDate: DateFormat.yMMMd().format(DateTime.now()).toString(),
                  toDate: DateFormat.yMMMd().format(DateTime.now()).toString(),
                  isdone: false,
                    color: Colors.greenAccent.value,
                    date: DateFormat.yMMMd().format(DateTime.now()).toString(),
                    content: content!,
                    title: title!));
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          )
        ],
      ),
    );
  }
}
