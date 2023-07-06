//import 'dart:js';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'calculator_buttons.dart';
class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  var userInput="";
  var userOutput="";
  final List<String> buttons=[

    "C","Sil","%","/",
    "7","8","9","*",
    "4","5","6","-",
    "1","2","3","+",
    " ","0",",","=",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: Colors.blue[300],
          title: const Text('Hesap Makinesi'),
        ),
      ),

      backgroundColor: Colors.blueGrey[100],
      body: Column(
        children: <Widget> [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                      child: Text(userInput,style: const TextStyle(fontSize: 20,),),),
                  Container(
                    padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(userOutput,style: const TextStyle(fontSize: 20,),),),
                ],
              ),
      ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (BuildContext context,int index){
                  // hepsini sil butonu
                  if(index==0){
                    return Buttons(
                      buttonClicked: (){
                        setState(() {
                          userInput="";
                        });

                      },
                      buttonText: buttons[index],
                      color: Colors.pink[200],
                      textColor: Colors.white,
                    );
                  }
                  //sil butonu
                  else if(index==1){
                    return Buttons(
                      buttonClicked: (){
                        setState(() {
                          userInput=userInput.substring(0,userInput.length-1);
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.red[200],
                      textColor: Colors.white,

                    );
                  }
                  // = işareti
                  else if(index==buttons.length-1){
                    return Buttons(
                      buttonClicked: (){
                        setState(() {
                          equalClicked();
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.purple[200],
                      textColor: Colors.black54,

                    );
                  }
                  else{
                    return Buttons(
                      buttonClicked: (){
                        setState(() {
                          userInput+=buttons[index];
                        });

                      },
                      buttonText: buttons[index],
                      color: isOperator(buttons[index]) ? Colors.blue[200]:Colors.blue,
                      textColor: isOperator(buttons[index]) ? Colors. black54: Colors.white,

                    );
                  }

                  }),
            ),
          ),
        ],
      ),
    );
  }
  bool isOperator(String x){
    if(x=="%" 	|| x=="/" 	|| x=="+" 	|| x=="-" 	|| x=="*" 	|| x=="="){
      return true;
    }
    return false;
  }
  void equalClicked(){
    String finalQuestion= userInput;
    Parser p=Parser();
    Expression exp=p.parse(finalQuestion);
    ContextModel cm=ContextModel();
    double eval=exp.evaluate(EvaluationType.REAL, cm);

    userOutput=eval.toString();
  }
}
