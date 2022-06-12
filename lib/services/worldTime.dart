import 'package:http/http.dart' as http;  //http.get
import 'dart:convert';  //jsonDecode
import 'package:intl/intl.dart';

class WorldTime {
  late String? location;  //location for ui
  late String? time = '';      //time in that location
  late String? flag;      //url to asset flag icon
  late String? url;       //location url for api end point
  late bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try{
      //Europe/London
      var url2 = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      // var url = Uri.parse('https://catfact.ninja/fact');
      final response = await http.get(url2);   //await causes the response to fail ...
      Map data = jsonDecode(response.body);
      // print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print('datetime: ' + datetime);    //works
      print('offset: ' + offset);

      //create a datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

    }catch(e){
      print(e);
      time = 'failed to get time';
    }
  }

}

