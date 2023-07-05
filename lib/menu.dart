import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MainPage.dart';
class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);
  final user= FirebaseAuth.instance.currentUser!;
  void userOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue[300],
        title: const Text('Hesap Makinesi'),
          actions: [
            IconButton(onPressed: userOut, icon: Icon(Icons.logout)),
          ]),

      backgroundColor: Colors.black54,
    );
  }
}
