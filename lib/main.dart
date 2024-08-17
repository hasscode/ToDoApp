import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/cubit/ToDoTasksCubit/ShowTasksCubit.dart';
import 'package:todo_app/cubit/appthemecubit/app_theme_cubit.dart';
import 'package:todo_app/cubit/appthemecubit/app_theme_states.dart';
import 'package:todo_app/helper/consts.dart';
import 'package:todo_app/models/NoteModel.dart';
import 'package:todo_app/models/TaskModel.dart';
import 'package:todo_app/models/ThemeEnum.dart';
import 'package:todo_app/pages/Splash.dart';

import 'cubit/NotesCubit/ShowNoteCubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(knotesbox);
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(kTaskesbox);
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const ToDoApp());
}
class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[ BlocProvider(
        create:(context)=> AppThemeCubit()..changeTheme(ThemeState.initial),
      ),
      BlocProvider(create:(context)=> ShowNoteCubit()),
BlocProvider(create: (context)=>ShowTasksCubit()),

    ],
      child: BlocBuilder<AppThemeCubit,AppThemeStates>(
    builder: (context,state){
      if(state is AppthemeLigthState){
        return MaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor:kPrimaryColor

          ),

          debugShowCheckedModeBanner: false,
          home: SplashPage(),

        );
      } else if(state is AppthemeDarkState){
        return MaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor:kPrimaryColorDark

          ),


          debugShowCheckedModeBanner: false,
          home: SplashPage(),

        );
      } return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor:kPrimaryColor

        ),

        debugShowCheckedModeBanner: false,
        home: SplashPage(),

      );
    }
    ),

    );
  }
}


