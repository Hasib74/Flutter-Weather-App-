import 'package:flutter/material.dart';
import 'package:weather_app/forecast/backgraound/backgraound_with_rigns.dart';
class Forecast extends StatelessWidget {
  Widget _temperatureText(){
   return
     Padding(

       padding: const EdgeInsets.only(left:10.0,top: 120),
       child: Align(
         alignment: Alignment.centerLeft,
         child: new Text(
          '38',
           style: new TextStyle(
            color: Colors.white,
            fontSize: 80.0
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
      ],
    );
  }
}
