import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location = ''; // loc name for UI
  String time = ''; // time for that loc
  String flag = ''; // URL to asset flag icon
  String url = ''; // aage waala part
  bool isDay = true;

  WorldTime({required this.location , required this.flag ,required this.url}){}

  Future<void> getTime() async {

    // make the request
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    //print(data);

    // get props from data
    String datetime = data['datetime'];
    String offset_hour = data['utc_offset'].substring(1,3);
    String offset_min = data['utc_offset'].substring(4,6);
    // print(datetime);


    // create a date time object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset_hour) , minutes: int.parse(offset_min)));

    // set the time
    time = DateFormat().add_jm().format(now);
    isDay = (now.hour > 6 && now.hour < 19) ? true : false;
  }


}

