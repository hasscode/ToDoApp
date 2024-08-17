import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/TaskModel.dart';
import '../cubit/ToDoTasksCubit/ShowTasksCubit.dart';
import '../pages/ShowTaskContentPage.dart';

class ToDoItem extends StatefulWidget {
 ToDoItem({super.key,required this.taskModel});
TaskModel taskModel;

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowTaskContentPage(taskModel: widget.taskModel)));

      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 130,
          width: double.infinity,
          child: Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            color:Color( widget.taskModel.color),
            elevation: 13,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ListTile(
                    title: widget.taskModel.isdone?Text(
                      widget.taskModel.title,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'Oswald',decoration: TextDecoration.lineThrough),
                    ) : Text(
                      widget.taskModel.title,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'Oswald'),
                    ),
                    subtitle:  Text(
                      widget.taskModel.content,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,

                      ),

                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.taskModel.isdone?widget.taskModel.isdone=false:widget.taskModel.isdone=true;
                          BlocProvider.of<ShowTasksCubit>(context).isdone =widget.taskModel.isdone;
                          widget.taskModel.save();
                        });
                      },
                      icon: widget.taskModel.isdone? const Icon(
                        Icons.check_circle,
                        color: Colors.greenAccent,
                        size: 40,
                      ) : const Icon(
                        Icons.check_circle_outline,
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
                        widget.taskModel.date,
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
