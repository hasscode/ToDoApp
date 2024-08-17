import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/appthemecubit/app_theme_cubit.dart';
import 'package:todo_app/models/NoteModel.dart';
import 'package:todo_app/pages/EditNotePage.dart';
import '../cubit/NotesCubit/ShowNoteCubit.dart';

class ShowNoteContentPage extends StatelessWidget {
  ShowNoteContentPage({super.key, required this.noteModel});
  NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          noteModel.title,
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditNotePage(noteModel: noteModel)));
            },
            icon: Icon(
              CupertinoIcons.pencil,
              size: 35,
              color: BlocProvider.of<AppThemeCubit>(context).appbartheme,
            ),
          ),
          IconButton(
            onPressed: () {
              noteModel.delete();
              BlocProvider.of<ShowNoteCubit>(context).showNote();
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
              noteModel.subtitle,
              style: TextStyle(
                fontSize: 20,
                color: BlocProvider.of<AppThemeCubit>(context).appbartheme,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
