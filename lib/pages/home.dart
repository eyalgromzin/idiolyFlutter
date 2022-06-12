import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = <dynamic, dynamic>{};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    print(data);

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  TextButton.icon(
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
                      Navigator.pushNamed(context, '/chooseBook');
                    },
                  ),
                  TextButton.icon(
                    icon: Icon(
                        Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                        'edit location',
                      style: TextStyle(
                          color: Colors.grey[300]
                      ),
                    ),
                   onPressed: () async {
                     dynamic result = await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data = {
                         'time': result['time'],
                         'location': result['location'],
                         'flag': result['flag'],
                         'isDayTime': result['isDayTime']
                       };
                     });
                   },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],
                          style: TextStyle(
                            color: Colors.white,
                              fontSize: 28,
                              letterSpacing: 2
                          ))
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66,
                      color: Colors.white,
                    ),
                  )
                ],
      ),
            ),
          )),
    );
  }
}
