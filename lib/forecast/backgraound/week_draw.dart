import 'package:flutter/material.dart';
class week_draw extends StatelessWidget {



  final week=[
    "Tuesday\nAugust 27",
    "Wednesday\nAugust 28",
    "Tursday\nAugust 29",
    "Friday\nAugust 30",
    "Saturday\n Septembar 01",
    "Sunday\n Septembar 02",
    "Monday\n Septembar 03",

  ];

  final Function(String title) onDaySelected;
  week_draw({
     this.onDaySelected
   });

  List<Widget> _buildDayButtons(){
    return week.map((String title){
      return  new Expanded(
          child:new GestureDetector(
            onTap: (){
               onDaySelected(title);

            },
            child: new Text(title,
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 14.0
              ),

            ),
          )
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new  Container(
      width: 150,
      height: double.infinity,
      color: const Color(0xAA234060),
      child: new Column(
        children: <Widget>[
          new Expanded(
              child:new Icon(
                Icons.refresh,
                color: Colors.white,
                size: 40.0,
              )
          ),

        ]
          ..addAll(_buildDayButtons()),
      ),
    );
  }
}
