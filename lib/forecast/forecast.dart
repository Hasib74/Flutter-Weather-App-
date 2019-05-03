import 'package:flutter/material.dart';
import 'package:weather_app/forecast/backgraound/backgraound_with_rigns.dart';
import 'package:weather_app/forecast/radio_list.dart';
class Forecast extends StatelessWidget {

  RadialListViewModel radialList;
  SlidingRadialListController slidingListController;

  Forecast({
    @required this.radialList,
    @required this.slidingListController,
  });

  Widget _temperatureText() {
    return new Align(
      alignment: Alignment.centerLeft,
      child: new Padding(
        padding: const EdgeInsets.only(top: 150.0, left: 10.0),
        child: new Text(
          '68°',
          style: new TextStyle(
            color: Colors.white,
            fontSize: 80.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new backgraound_with_rings(),

        _temperatureText(),

        new SlidingRadiaList(
          radialList: radialList,
          controller: slidingListController,
        ),

        //new Rain(),
      ],
    );
  }
}
