import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/NoteModel.dart';
import 'package:todo_app/pages/ShowNoteContentPage.dart';
import '../cubit/NotesCubit/ShowNoteCubit.dart';

class NoteItem extends StatelessWidget {
  NoteItem({super.key, required this.noteModel});
  NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowNoteContentPage(
                      noteModel: noteModel,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 150,
          width: double.infinity,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            color: Color(noteModel.color),
            elevation: 13,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: ListTile(
                    title: Text(
                      noteModel.title,
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'Oswald'),
                    ),
                    subtitle: Text(
                      noteModel.subtitle,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        noteModel.delete();
                        BlocProvider.of<ShowNoteCubit>(context).showNote();
                      },
                      icon: const Icon(
                        Icons.delete_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        noteModel.date,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
