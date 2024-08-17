import 'package:flutter/material.dart';

import '../helper/consts.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.height,
      required this.symmetricHoizontalPadding,
      required this.onPressed});
  double height;
  double symmetricHoizontalPadding;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: symmetricHoizontalPadding),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(backgroundColor: kSecondryColor),
            child: const Text('Add',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Oswald',
                  color: Colors.white,
                )),
          ),
        ));
  }
}
