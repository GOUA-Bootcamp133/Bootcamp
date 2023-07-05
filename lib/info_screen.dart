import 'package:bootcamp_goua/auth.dart';
import 'package:flutter/cupertino.dart';

import 'welcome_screens/info_page0.dart';
import 'welcome_screens/info_page1.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'welcome_screens/info_page2.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  //son sayfa kontrol, buton yazısı değişmesi için
  bool lastPage=false;
  //ilk sayfa kontrol
  bool firstPage=true;
  //hangi sayfada olduğumuzu görmek için controller
  PageController _controller= PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index){
                setState(() {
                  lastPage=(index==2);
                  firstPage=(index==0);
                });
              },
              children: [
               InfoPage0(),
                InfoPage1(),
                InfoPage2(),
              ],
            ),
            Container(
              alignment: Alignment(0,-0.9),
              child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //
                    children: [
                      Container(child: Text(""),),
                      Container(child: Text(""),),
                      Container(child: Text(""),),
                      Container(child: Text(""),),
                      GestureDetector(
                        onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context)
                                {
                                  return Auth(); // loginpage idi önce ama kontrol gerek o yüzden auth
                                }
                            ));
                        },
                        child: Text("Atla", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.pink),),
                      ),
                    ],
                  ),

              ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 600, 0, 0),
              child: Container(
                width: 400,
                height: 100,
                alignment: Alignment(0,0.75),
                //color: Colors.pinkAccent,
                //width: 700,
                //margin: EdgeInsets.fromLTRB(50,0,50,0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 73),
                    child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            firstPage ?
                            Expanded(
                              child: GestureDetector(
                                onTap:(){
                                  },
                                child: Text("",
                                textAlign: TextAlign.center,),
                          ),
                            )
                            :
                            Expanded(
                              child: GestureDetector(
                                onTap:(){
                                  _controller.previousPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                },
                                child: Text("Geri",textAlign: TextAlign.center, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.pink),),
                              ),
                            ),


                            Expanded(child: Container(
                                  alignment: Alignment(0,1),
                                  child: SmoothPageIndicator(controller: _controller, count: 3))
                            ),
                            lastPage
                                ?
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context)
                                          {
                                            return Auth(); // loginpage idi önce ama kontrol gerek o yüzden auth
                                          }
                                      ));
                                },
                                  child: Text("Tamam",textAlign: TextAlign.center, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.pink),),
                              ),
                            )
                              : Expanded(
                                child: GestureDetector(
                                onTap:(){
                                  _controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn
                                   );
                                },
                                child: Text("İleri",textAlign: TextAlign.center, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.pink),),
                            ),
                              ),
                          ],

                            ),
                  ),

                  ),
            ),

        ],
        ),
      ),
    );
  }
}





