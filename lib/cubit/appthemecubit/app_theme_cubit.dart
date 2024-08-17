import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/appthemecubit/app_theme_states.dart';
import 'package:todo_app/helper/consts.dart';
import 'package:todo_app/models/ThemeEnum.dart';

class AppThemeCubit extends Cubit<AppThemeStates>{
  AppThemeCubit() :super(InitialState());
late Color backgroundtheme ;
late Color appbartheme;
late  Icon themeicon  ;
late bool theme;
late var thememode = ThemeMode.system;
   changeTheme(ThemeState state){

    switch(state){
      case ThemeState.initial :{
if(sharedPreferences!.getString('theme')!=null){

  if(sharedPreferences!.getString('theme')=='l'){
    backgroundtheme =kPrimaryColor;
    appbartheme = Colors.black;
  themeicon =const Icon(
  Icons.light_mode,
  color: Colors.black,
    size: 30,
    );
theme =true;
    emit(AppthemeLigthState());
  }
  else {
    themeicon =const Icon(
      Icons.dark_mode_outlined,
      color: Colors.white,
      size: 30,
    );
    appbartheme = Colors.white;
    backgroundtheme =kPrimaryColorDark;
 theme =false;
    emit(AppthemeDarkState());}
} else{
if(ThemeMode.system==ThemeMode.light){  sharedPreferences!.setString('theme', 'l');
backgroundtheme =kPrimaryColor;
appbartheme = Colors.black;
themeicon =const Icon(
  Icons.light_mode,
  color: Colors.black,
  size: 30,
);
theme =true;
emit(AppthemeLigthState());}
else{
  sharedPreferences!.setString('theme', 'd');
  themeicon =const Icon(
    Icons.dark_mode_outlined,
    color: Colors.white,
    size: 30,
  );

  appbartheme = Colors.white;
  backgroundtheme =kPrimaryColorDark;
  theme =false;
  emit(AppthemeDarkState());
}

}
        break;
      }
      case ThemeState.light : {
        sharedPreferences!.setString('theme', 'l');
    backgroundtheme =kPrimaryColor;
        appbartheme = Colors.black;
        themeicon =const Icon(
          Icons.light_mode,
          color: Colors.black,
          size: 30,
        );
        theme =true;
emit(AppthemeLigthState());
         break;
      }
      case ThemeState.dark : {
        sharedPreferences!.setString('theme', 'd');
        themeicon =const Icon(
          Icons.dark_mode_outlined,
          color: Colors.white,
          size: 30,
        );

        appbartheme = Colors.white;
        backgroundtheme =kPrimaryColorDark;
        theme =false;
        emit(AppthemeDarkState());
        break;}

    }
  }

}