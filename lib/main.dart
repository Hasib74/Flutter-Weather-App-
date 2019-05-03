import 'package:flutter/material.dart';
import 'package:weather_app/forecast/backgraound/Rain.dart';
import 'package:weather_app/forecast/backgraound/app_bar.dart';
import 'package:weather_app/forecast/backgraound/week_draw.dart';
import 'package:weather_app/Genaric_widget/sliding_drawer.dart';
import 'package:weather_app/forecast/forcast_list.dart';
import 'package:weather_app/forecast/forecast.dart';
import 'package:weather_app/forecast/radio_list.dart';

void main() => runApp(MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    ));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  OpenableController openableController;
  SlidingRadialListController slidingListController;
  String selectedDay = 'Monday, August 26';

  @override
  void initState() {
    super.initState();

    openableController = new OpenableController(
      vsync: this,
      openDuration: const Duration(milliseconds: 250),
    )
      ..addListener(() => setState(() {}));

    slidingListController = new SlidingRadialListController(
      itemCount: forecastRadialList.items.length,
      vsync: this,
    )
      ..open();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[


        new Forecast(
          radialList: forecastRadialList,
          slidingListController: slidingListController,
        ),
        new Rain(),

        new app_bar(
          onDrawerArrowTap: openableController.open,
          selectedDay: selectedDay,
        ),


        new sliding_drawer(
          openableController: openableController,
          drawer: new WeekDrawer(
            onDaySelected: (String title) {
              setState(() {
                selectedDay = title.replaceAll('\n', ', ');
              });

              slidingListController
                  .close()
                  .then((_) => slidingListController.open());

              openableController.close();
            },
          ),
        ),

       // new Rain(),
      ],
    ));
  }
}
