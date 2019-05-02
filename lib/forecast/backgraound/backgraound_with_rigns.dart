import 'package:flutter/material.dart';


class backgraound_with_rings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset("img/wether_wallpaper.jpeg",fit: BoxFit.cover,),

          new ClipOval(
            clipper: new CircleClipper(
              radius:140,
              offset:const Offset(40.0, 0.0),
            ),
            child: new Image.asset("img/wether_wallpaper.jpeg"),
          ),

          new CustomPaint(
            painter: new WhiteCircleCutoutPainter(
                centerOffset: const Offset(40.0, 0.0),
                circles: [
                  new Circle(radius: 140.0,alpha: 0x10),
                  new Circle(radius: 140.0+15.0,alpha:0x28 ),
                  new Circle(radius: 140.0+30.0,alpha:0x38 ),
                  new Circle(radius: 140.0+75.0,alpha:0x50 )
                ]
            ),
            child: Container(

            ),
          )

        ],
      ),

    );;
  }
}

class CircleClipper extends CustomClipper<Rect>{
  final double radius;
  final Offset offset;


  CircleClipper({
    this.radius,
    this.offset = const Offset(0.0, 0.0)
  }
      );

  @override
  Rect getClip(Size size) {
    // TODO: implement getClip

    return new Rect.fromCircle(
      center: new Offset(0.0, size.height/2)+offset,
      radius: radius,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}

class WhiteCircleCutoutPainter extends CustomPainter{
  final Color overlayColor=const Color(0xFFAA88AA);
  final List<Circle> circles;
  final Offset centerOffset;
  final Paint whitePaint;
  final Paint borderPaint;

  WhiteCircleCutoutPainter({
    this.circles=const[],
    this.centerOffset=const Offset(0.0,0.0)
  }) : whitePaint=new Paint(),
        borderPaint=new Paint(){
    borderPaint
      ..color=const Color(0x10FFFFFF)
      ..style=PaintingStyle.stroke
      ..strokeWidth=3.0;
  }


  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    for(var i=1;i<circles.length;++i){
      _maskCircle(canvas, size, circles[i-1].radius);
      whitePaint.color=overlayColor.withAlpha(circles[i-1].alpha);
      canvas.drawCircle(
          new Offset(0.0, size.height/2)+centerOffset, circles[i].radius, whitePaint);

      canvas.drawCircle(
        new Offset(0.0, size.height/2)+centerOffset,
        circles[i-1].radius,
        borderPaint,
      );
    }

    _maskCircle(canvas, size, circles.last.radius);


    whitePaint.color=overlayColor.withAlpha(circles.last.alpha);
    canvas.drawRect(
        new Rect.fromLTWH(
            0.0,
            0.0,
            size.width,
            size.height),
        whitePaint);
    canvas.drawCircle(new Offset(0.0, size.height/2)+centerOffset, circles.last.radius, borderPaint);
  }

  _maskCircle(Canvas canvas,Size size,double radius){
    Path clippedCircle=new Path();
    clippedCircle.fillType =PathFillType.evenOdd;
    clippedCircle.addRect(new Rect.fromLTWH(0.0, 0.0, size.width, size.height));

    clippedCircle.addOval(
        new Rect.fromCircle(
            center: new Offset(0.0, size.height/2)+centerOffset,
            radius: radius
        )
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

class Circle{
  final double radius;
  final  int alpha;

  Circle({this.radius, this.alpha=0xFF});





}