import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/cubit/NotesCubit/AddNoteStates.dart';
import 'package:todo_app/models/NoteModel.dart';
import '../../helper/consts.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = kColors[0];
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      note.color = color.value;
      await Hive.box<NoteModel>(knotesbox).add(note);
      emit(AddNoteSuccess());
    } on Exception catch (e) {
      emit(AddNoteFailure());
    }
  }
}
