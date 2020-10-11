import 'package:flutter/material.dart';
import 'package:e03_mvc/views/item.view.dart';

//const bgColor = Colors.grey[900];

void main() {
  runApp(MaterialApp(
    title: 'MVC',
    debugShowCheckedModeBanner: false,
    home: MainApp(),
    theme: ThemeData(
        primaryColor: Colors.black,
        //accentColor: Colors.redAccent
        primarySwatch: Colors.red
      ),
  ));
}

