import 'package:bootcamp_goua/login_or_reg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'MainPage.dart';
// girişin geçerliliğine göre hangi sayfanın açılacağına karar vermesi için
class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){ //snapshot yerine başka bir şey kullanabiliriz ama yaygını bu (stream vs )
          //giriş yapıldı
          if (snapshot.hasData){
            return MainPage();
          }
          //giriş yapılamadı
          else{
            return LogReg();
          }
        },
      ),

    );
  }
}
