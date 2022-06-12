import 'package:flutter/material.dart';
import 'package:world_time/services/worldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

          },
        ),
      ),
    );
  }
}
