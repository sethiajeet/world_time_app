import 'package:flutter/material.dart';
import '../services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading..';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Kolkata' , flag: 'india.png' , url: 'Asia/Kolkata');
    await instance.getTime();
    print(instance.time);
    setState(() {
      time = instance.time;
    });
    Navigator.pushReplacementNamed(context, '/home' , arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: const Center(
          child: CircularProgressIndicator(),
        )
    );
  }
}
