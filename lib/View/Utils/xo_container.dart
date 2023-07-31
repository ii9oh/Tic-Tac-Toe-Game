// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

Container customContainer({
  required String text,
  required Color color,
}) =>
    Container(
      height: 50,
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "HD",
              fontSize: 19,
            ),
          ),
        ],
      ),
    );

//>-----------------------------------------------------------------------------

Visibility customAnimatedContainer({
  required String text,
  required Color color,
  required bool Winner,
}) =>
    Visibility(
      visible: Winner,
      child: AnimatedContainer(
          height: 50,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: color,
          ),
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: Center(
              child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "HD",
              fontSize: 25,
            ),
          ))),
    );

//>-----------------------------------------------------------------------------

Visibility customVisibilty({
  required bool visible,
  required Color color,
  required String text,
}) =>
    Visibility(
      visible: visible,
      child: Container(
        height: 50,
        width: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontFamily: "HD",
                fontSize: 23,
              ),
            ),
          ],
        ),
      ),
    );
