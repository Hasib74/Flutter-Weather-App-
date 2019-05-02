import 'package:flutter/material.dart';
import 'package:weather_app/forecast/backgraound/app_bar.dart';
import 'package:weather_app/forecast/backgraound/backgraound_with_rigns.dart';
import 'package:weather_app/forecast/backgraound/week_draw.dart';
import 'package:weather_app/Genaric_widget/sliding_drawer.dart';
import 'package:weather_app/forecast/forecast.dart';

void main() => runApp(MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    ));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  OpenableController openableController;
  String selectedDay='Monday,August 26';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openableController = new OpenableController(
        vsync: this, openDuration: const Duration(milliseconds: 250))
      ..addListener(() => setState(() {}));
    //..open();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
       new Forecast(),


        new app_bar(
          onDrawerArrowTap: openableController.open,
          selectedDay: selectedDay,
        ),

        new sliding_drawer(drawer: new week_draw(
          onDaySelected: (String title) {
            setState(() {
              selectedDay=title.replaceAll('\n', ', ');
            });
            openableController.close();
          }

        ),openableController: openableController,),


      ],
    ));
  }
}
