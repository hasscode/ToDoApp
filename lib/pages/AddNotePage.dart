import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/NotesCubit/AddNoteCubit.dart';
import 'package:todo_app/cubit/NotesCubit/AddNoteStates.dart';
import 'package:todo_app/cubit/appthemecubit/app_theme_cubit.dart';
import 'package:todo_app/widgets/AddNoteForm.dart';
import '../cubit/NotesCubit/ShowNoteCubit.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Add Note',
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
          body: BlocConsumer<AddNoteCubit, AddNoteStates>(
              builder: (context, state) {
            return AddNoteForm();
          }, listener: (context, state) {
            if (state is AddNoteFailure) {
              print('failed');
            }
            if (state is AddNoteSuccess) {
              BlocProvider.of<ShowNoteCubit>(context).showNote();
              Navigator.pop(context);
            }
          })),
    );
  }
}
