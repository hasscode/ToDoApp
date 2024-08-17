import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/appthemecubit/app_theme_cubit.dart';
import 'HomePage.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{
  @override
  void initState() {

    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)
      {
        return const HomePage();
      }
      ));
    });
  }
  @override
  void dispose() {

    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:    BlocProvider.of<AppThemeCubit>(context).backgroundtheme,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
Container(
    width: 400,
    height: 100,
    child: Image.asset('assets/images/logo.png'))

          ],
        ),
      ),
    );
  }
}
