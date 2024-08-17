

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/appthemecubit/app_theme_cubit.dart';
import '../helper/consts.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.maxline,
      required this.hinttext,
      required this.onSaved,
      required this.onChanged,this.textEditingController});
  int maxline;
  String hinttext;
  void Function(String?)? onSaved;
  void Function(String)? onChanged;
   TextEditingController? textEditingController ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextFormField(
controller: textEditingController,

        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'field is required';
          }
        },
        onChanged: onChanged,
        onSaved: onSaved,
c
        decoration: InputDecoration(

          hintText: hinttext,
          hintStyle: TextStyle(color: kSecondryColor),
          border: const OutlineInputBorder(

            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: kSecondryColor)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
        ),
        style: TextStyle(
            color: BlocProvider.of<AppThemeCubit>(context).appbartheme,
            fontWeight: FontWeight.bold),
        maxLines: maxline,
      ),
    );
  }
}
