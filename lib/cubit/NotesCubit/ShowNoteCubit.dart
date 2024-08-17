import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/cubit/NotesCubit/ShowNoteStates.dart';
import 'package:todo_app/models/NoteModel.dart';

import '../../helper/consts.dart';

class ShowNoteCubit extends Cubit<ShowNoteStates> {
  ShowNoteCubit() : super(ShowNoteInitial());
  List<NoteModel> notes = [];
  showNote() {
    notes = Hive.box<NoteModel>(knotesbox).values.toList();
    emit(ShowNoteSuccess());
  }
}
