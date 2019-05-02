import 'package:flutter/material.dart';
import 'package:weather_app/Genaric_widget/spinner_text.dart';
class app_bar extends StatelessWidget {
  Function onDrawerArrowTap ;
  final String selectedDay;


  app_bar({this.onDrawerArrowTap,
          this.selectedDay

  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: 0.0,
      child: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
          title: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              new SpinnerText(

               text: selectedDay,
              ),

              Text("Dhaka",style: TextStyle(fontSize: 20,color: Colors.white),),
            ],
          ),
          actions: <Widget>[
            new IconButton(icon:Icon(Icons.arrow_forward_ios),color: Colors.white, onPressed: onDrawerArrowTap)
          ],
        ),
      ),
    );
  }
}
