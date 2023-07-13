import "package:flutter/material.dart";
class InfoPage2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white30,
      child: SingleChildScrollView(
        child: Column(
          children: [

            Image.asset("lib/images/2.jpg"),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 60, 15, 15 ),
              child: Text("Takvim bölümü sayesinde harcamalarını planlayabilirsin.                                Hoşgeldin.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}
