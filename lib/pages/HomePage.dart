import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/appthemecubit/app_theme_cubit.dart';
import 'package:todo_app/models/ThemeEnum.dart';
import 'package:todo_app/pages/NotesPage.dart';
import 'package:todo_app/pages/ToDoPage.dart';
import '../helper/consts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int i = 0;
  final pages = [
     NotesPage(),
     ToDoPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: const Color(0xff68BAB5),
          color: kSecondryColor,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              this.i = index;
            });
          },
          items: [
            Icon(
              Icons.sticky_note_2,
              size: 35,
              color: kPrimaryColor,
            ),
            Icon(Icons.checklist_rtl_rounded, size: 35, color: kPrimaryColor)
          ]),
      appBar: AppBar(
          title: Text(
            'Hello !',
            style: TextStyle(
                color: BlocProvider.of<AppThemeCubit>(context).appbartheme,
                fontSize: 35,
                fontFamily: 'Oswald',
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (BlocProvider.of<AppThemeCubit>(context).theme) {
                      BlocProvider.of<AppThemeCubit>(context)
                          .changeTheme(ThemeState.dark);
                    } else {
                      BlocProvider.of<AppThemeCubit>(context)
                          .changeTheme(ThemeState.light);
                    }
                  });
                },
                icon: BlocProvider.of<AppThemeCubit>(context).themeicon),
            const SizedBox(
              width: 20,
            )
          ]),
      body: pages[i],
    );
  }
}
