import "package:flutter/material.dart";
class InfoPage0 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white30,
      child: SingleChildScrollView(
        child: Column(
          children: [

            Image.asset("lib/images/0.jpg"),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 60, 15, 15 ),
              child: Text("Merhaba, hesApp sizlere çeşitli imkanlar sağlar. Hemen kullanıcı hesabı oluşturabilir veya üyemizsen giriş yaparak hesApp'a katılabilirsin.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}
