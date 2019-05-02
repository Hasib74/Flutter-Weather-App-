import 'package:flutter/material.dart';
class SpinnerText extends StatefulWidget {
 final  String  text;


 SpinnerText({this.text=''});

 @override
  _SpinnerTextState createState() => _SpinnerTextState();
}

class _SpinnerTextState extends State<SpinnerText> with SingleTickerProviderStateMixin{
  String topText='';
  String bottomText='';
  AnimationController _animationController;
  Animation<double> _spainAnimation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomText=widget.text;
    _animationController=new AnimationController(
      duration: const Duration(milliseconds: 750) ,vsync: this)
    ..addListener(()=>setState((){}))
    ..addStatusListener((AnimationStatus status){
      if(status==AnimationStatus.completed){
         setState(() {
           bottomText=topText;
           topText='';
           _animationController.value=0.0;
         });
      }
    });
    _spainAnimation=new CurvedAnimation(parent: _animationController, curve: Curves.elasticOut);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
  @override
  void didUpdateWidget(SpinnerText oldWidget) {

    super.didUpdateWidget(oldWidget);
    if(widget.text !=oldWidget.text){
      topText=widget.text;
      _animationController.forward();
    }

  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipper: new RectClipper(),
      child: new Stack(
        children: <Widget>[
        new  FractionalTranslation(

            translation:new Offset(0.0, _spainAnimation.value-1.0) ,
            child: Text(
              topText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0
              ),
            ),
          ),

        FractionalTranslation(
          translation: new Offset(0.0, _spainAnimation.value),
          child: Text(
              bottomText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0
              ),
            ),
        )
        ],
      ),
    );
  }
}
class RectClipper extends  CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return new Rect.fromLTWH(0.0, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}
