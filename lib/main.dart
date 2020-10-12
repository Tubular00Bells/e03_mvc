import 'package:flutter/material.dart';
import 'package:e03_mvc/views/item.view.dart';

void main() {
  runApp(MaterialApp(
    title: 'MVC',
    debugShowCheckedModeBanner: false,
    home: MainApp(),
    theme: ThemeData(
        primaryColor: Colors.black,
        primarySwatch: Colors.purple
      ),
  ));
}

