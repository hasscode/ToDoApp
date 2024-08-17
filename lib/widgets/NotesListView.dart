import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/NotesCubit/ShowNoteCubit.dart';
import 'package:todo_app/cubit/NotesCubit/ShowNoteStates.dart';
import 'package:todo_app/widgets/NoteItem.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShowNoteCubit>(context).showNote();
    return BlocBuilder<ShowNoteCubit, ShowNoteStates>(
        builder: (context, state) {
      return Expanded(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: BlocProvider.of<ShowNoteCubit>(context).notes.length,
            itemBuilder: (context, i) {
              return NoteItem(
                  noteModel: BlocProvider.of<ShowNoteCubit>(context).notes[i]);
            }),
      );
    });
  }
}
