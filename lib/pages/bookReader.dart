import 'dart:io';

import 'package:flutter/material.dart';
import 'package:world_time/services/worldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:file_picker/file_picker.dart';

class BookReader extends StatefulWidget {
  const BookReader({Key? key}) : super(key: key);

  @override
  _BookReaderState createState() => _BookReaderState();
}

class _BookReaderState extends State<BookReader> {

  String time = 'loading...';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: Text('read book'),
      )
    );
  }
}
