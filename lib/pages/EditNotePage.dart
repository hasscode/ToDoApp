import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/widgets/EditColorList.dart';
import '../cubit/NotesCubit/ShowNoteCubit.dart';
import '../cubit/appthemecubit/app_theme_cubit.dart';
import '../models/NoteModel.dart';
import '../widgets/CustomTextFormField.dart';

class EditNotePage extends StatefulWidget {
  EditNotePage({super.key, required this.noteModel});

  NoteModel noteModel;

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  TextEditingController textEditingControllerTitle = TextEditingController();
  TextEditingController textEditingControllerSubtitle = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    textEditingControllerTitle.text =  widget.noteModel.title ;
    textEditingControllerSubtitle.text = widget.noteModel.subtitle ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Edit Note',
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
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                BlocProvider.of<ShowNoteCubit>(context).showNote();
                Navigator.pop(context);
                Navigator.pop(context);
                widget.noteModel.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }

            },
            icon: Icon(
              Icons.check,
              size: 38,
              color: BlocProvider.of<AppThemeCubit>(context).appbartheme,
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Form(
        key: formkey,
        autovalidateMode: autovalidateMode,
        child: ListView(
          children: [
            CustomTextFormField(
              textEditingController: textEditingControllerTitle,
              onChanged: (val) {
                widget.noteModel.title = val;
              },
              hinttext: '',
              maxline: 1,
              onSaved: (v) {},
            ),

            CustomTextFormField(
textEditingController: textEditingControllerSubtitle,
              onChanged: (val) {
                widget.noteModel.subtitle = val;
              },
              hinttext: '',
              maxline: 20,
              onSaved: (val) {},
            ),
            EditColorList(noteModel: widget.noteModel)
          ],
        ),
      ),
    );
  }
}
