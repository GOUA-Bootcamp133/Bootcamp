import 'package:bootcamp_goua/calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'calculator.dart';
import 'notes.dart';
class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final user= FirebaseAuth.instance.currentUser!;
  void userOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(automaticallyImplyLeading: false, backgroundColor: Colors.blue[300],
          leading: Icon(Icons.account_circle),
          title: Center(child: const Text('Ana Menü')),
          actions: [
        IconButton(onPressed: userOut, icon: Icon(Icons.logout)),
      ]),
      body: SafeArea(

        child: Center(child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Text("Merhaba! "+user.email!, style: TextStyle( color: Colors.black54, fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context)
                        {
                          return Menu(); // loginpage idi önce ama kontrol gerek o yüzden auth
                        }
                    ));
              },
              child: Container(
                //padding: const EdgeInsets.all(70),
                //margin: const EdgeInsets.symmetric(horizontal: 45),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[300],
                ),
                child: Icon(Icons.calculate_outlined, size: 100,)),
            ),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context)
                        {
                          return Notes(); // loginpage idi önce ama kontrol gerek o yüzden auth
                        }
                    ));
              },
              child: Container(
                //padding: const EdgeInsets.all(70),
                //margin: const EdgeInsets.symmetric(horizontal: 45),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[300],
                  ),
                  child: Icon(Icons.edit_note_sharp, size: 100,)),
            ),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context)
                        {
                          return HomePage(); // loginpage idi önce ama kontrol gerek o yüzden auth
                        }
                    ));
              },
              child: Container(
                //padding: const EdgeInsets.all(70),
                //margin: const EdgeInsets.symmetric(horizontal: 45),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[300],
                  ),
                  child: Icon(Icons.calendar_month, size: 100,)),
            ),

            //Text("Anasayfaya giriş yapıldı.", style: TextStyle( color: Colors.pink, fontSize: 30, fontWeight: FontWeight.bold),),
          ],
        )),
      ),
    );
  }
}
