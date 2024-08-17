import 'package:flutter/material.dart';
import 'package:todo_app/models/NoteModel.dart';
import '../helper/consts.dart';
import 'ColorItem.dart';

class EditColorList extends StatefulWidget {
  const EditColorList({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  State<EditColorList> createState() => _EditColorListState();
}

class _EditColorListState extends State<EditColorList> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
          height: 2 * 30,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: kColors.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedindex = i;
                        widget.noteModel.color = kColors[i].value;
                      });
                    },
                    child: ColorItem(
                      isActive: selectedindex == i,
                      color: kColors[i],
                    ));
              })),
    );
  }
}
