import 'dart:io';

import 'package:flutter/material.dart';
import 'package:world_time/services/worldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:file_picker/file_picker.dart';

class ChooseBook extends StatefulWidget {
  const ChooseBook({Key? key}) : super(key: key);

  @override
  _ChooseBookState createState() => _ChooseBookState();
}

class _ChooseBookState extends State<ChooseBook> {

  String time = 'loading...';

  @override
  void initState() {
    super.initState();
  }

  chooseFile() async {
    print('in choose file');

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String? filePath = result.files.single.path;
      if(filePath != null){
        var name = 'Smith';
        //File file = File(filePath);
        Navigator.pushNamed(context, '/bookReader');
      }
    } else {
      // User canceled the picker
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: TextButton.icon(
          icon: Icon(
            Icons.book,
            color: Colors.grey[300],
          ),
          label: Text(
            'read book',
            style: TextStyle(
                color: Colors.grey[300]
            ),
          ),
          onPressed: () async {
            chooseFile();
          },
        ),
      ),
    );
  }
}
