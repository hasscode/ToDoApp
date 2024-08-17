import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/cubit/NotesCubit/AddNoteCubit.dart';
import 'package:todo_app/models/NoteModel.dart';
import 'package:todo_app/widgets/NoteColorsList.dart';
import 'package:todo_app/widgets/CustomButton.dart';

import '../cubit/appthemecubit/app_theme_cubit.dart';
import 'CustomTextFormField.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;

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
            hinttext: 'write task here',
            maxline: 20,
            onSaved: (val) {
              subtitle = val;
            },
          ),
          const NoteColorList.ColorsList(),
          CustomButton(
            height: 60,
            symmetricHoizontalPadding: 25,
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                BlocProvider.of<AddNoteCubit>(context).addNote(NoteModel(
                    color: Colors.greenAccent.value,
                    date: DateFormat.yMMMd().format(DateTime.now()).toString(),
                    subtitle: subtitle!,
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
