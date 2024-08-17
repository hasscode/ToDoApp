import 'package:flutter/material.dart';
import 'package:todo_app/pages/AddTaskPage.dart';
import 'package:todo_app/widgets/AddSloganCard.dart';
import 'package:todo_app/widgets/TasksListView.dart';
import 'package:todo_app/widgets/ToDoItem.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AddSloganCard(
            slogan: 'Mange Your Time ',
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskPage()));},
          ),
TasksListView()
        ],
      ),
    );
  }
}
