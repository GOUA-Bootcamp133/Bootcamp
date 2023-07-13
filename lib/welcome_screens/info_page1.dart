import "package:flutter/material.dart";
class InfoPage1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white30,
      child: SingleChildScrollView(
        child: Column(
          children: [

            Image.asset("lib/images/1.jpg"),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 60, 15, 15 ),
              child: Text("Not alma bölümünü ve hesap makinesini kullanarak harcamalarınızı hesaplayabilirsiniz.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}
