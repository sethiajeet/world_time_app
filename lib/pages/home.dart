import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {


    if(data.isEmpty) data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    // set BG
    String bgImage = data['isDay'] ? 'assets/day.jpeg' : 'assets/night.jpg';

    return Scaffold(
      backgroundColor: (data['isDay']) ? Colors.blue : Colors.indigo[700],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0 , 120.0 , 0.0 , 0.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDay': result['isDay'],
                          'flag': result['flag']
                        };
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                        color: (data["isDay"]) ? Colors.grey : Colors.white
                    ),
                  label: Text(
                      'Edit Location',
                      style: TextStyle(
                          color: (data["isDay"]) ? Colors.grey : Colors.white,
                      ),
                  )
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 2.0,
                          color: (data["isDay"]) ? Colors.black : Colors.white
                        ),
                    ),
                  ]
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 70.0,
                      color: (data["isDay"]) ? Colors.black : Colors.white
                  )
                )
              ]
            ),
          ),
        )
      ),
    );
  }
}
