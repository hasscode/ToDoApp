import 'package:flutter/material.dart';
import 'package:todo_app/pages/AddNotePage.dart';
import 'package:todo_app/widgets/AddSloganCard.dart';
import 'package:todo_app/widgets/NotesListView.dart';

import '../cubit/NotesCubit/ShowNoteCubit.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AddSloganCard(
            slogan: 'Write your notes',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddNotePage()));
            },
          ),
          const NotesListView()
        ],
      ),
    );
  }
}
