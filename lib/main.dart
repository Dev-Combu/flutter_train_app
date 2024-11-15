import 'package:flutter/material.dart';
import 'package:flutter_train_app/hompage.dart';
import 'package:flutter_train_app/train_seat_page.dart';
import 'package:flutter_train_app/train_station_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SeatPage(),
    );
  }
}
