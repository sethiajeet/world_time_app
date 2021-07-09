import 'package:flutter/material.dart';
import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<WorldTime> locations = [
      WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
      WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
      WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
      WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
      WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.jpg'),
      WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.jpg'),
      WorldTime(location: 'Seoul', flag: 'south_korea.png' , url: 'Asia/Seoul'),
      WorldTime(location: 'Jakarta', flag: 'indonesia.jpg' , url: 'Asia/Jakarta'),
      WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata')
    ];


    void upDateTime(index) async {
      WorldTime instance = locations[index];
      await instance.getTime();
      // navigate -> home
      Navigator.pop(context , {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDay': instance.isDay
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0 , horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  //print(locations[index].location);
                  upDateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                   backgroundImage: AssetImage('assets/${locations[index].flag}')
                ),
              )
            ),
          );
        },
      )
    );
  }
}

