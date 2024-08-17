import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/helper/consts.dart';

import '../cubit/NotesCubit/AddNoteCubit.dart';
import 'ColorItem.dart';

class NoteColorList extends StatefulWidget {
  const NoteColorList.ColorsList({super.key});

  @override
  State<NoteColorList> createState() => _NoteColorListState();
}

class _NoteColorListState extends State<NoteColorList> {
  @override
  int selectedindex = 0;

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
                        BlocProvider.of<AddNoteCubit>(context).color =
                            kColors[i];
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
