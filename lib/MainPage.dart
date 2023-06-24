import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final user= FirebaseAuth.instance.currentUser!;
  void userOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        IconButton(onPressed: userOut, icon: Icon(Icons.logout)),
      ]),
      body: SafeArea(
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Anasayfaya giriş yapıldı.", style: TextStyle( color: Colors.lightGreen, fontSize: 30, fontWeight: FontWeight.bold),),
            Text(user.email!, style: TextStyle( color: Colors.lightGreen, fontSize: 30, fontWeight: FontWeight.bold),),
          ],
        )),
      ),
    );
  }
}
