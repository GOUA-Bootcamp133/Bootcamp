import 'package:flutter/cupertino.dart';

class Buttons extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonClicked;
  const Buttons({this.buttonClicked,this.color,this.textColor,required this.buttonText});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: buttonClicked,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
              child: Container(
                color: color,
                child: Center(child: Text(buttonText,style: TextStyle(color: textColor, fontSize: 25,fontWeight: FontWeight.bold),),),
              ),
          ),
        ),
      ),
    );
  }
}
