import 'package:flutter/material.dart';
import 'package:world_time/pages/bookReader.dart';
import 'package:world_time/pages/chooseBook.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
      '/chooseBook': (context) => const ChooseBook(),
      '/bookReader': (context) => const BookReader()
    }
  ));
}
