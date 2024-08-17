import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/consts.dart';

class AddSloganCard extends StatelessWidget {
  AddSloganCard({super.key, required this.slogan, required this.onTap});
  String slogan;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            width: double.infinity,
            height: 100,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)),
              elevation: 15,
              color: kSecondryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      slogan,
                      style: const TextStyle(
                          fontSize: 27,
                          color: Colors.white,
                          fontFamily: 'Oswald'),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                            child: Icon(
                          CupertinoIcons.plus_app,
                          color: Colors.white,
                          size: 50,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
