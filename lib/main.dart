import 'package:flutter/material.dart';
import 'package:just_dabao/screens/Splash.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'JustDabao',
      debugShowCheckedModeBanner: false,
      theme:
          new ThemeData(accentColor: Colors.grey, primaryColor: Colors.amber),
      home: Splash(),
    ),
  );
}
