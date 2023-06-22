import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'text_box.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//textboxları ayırmak için
  final usernameController= TextEditingController();

  final passwordController= TextEditingController();
//şifre bölümü button kontrol
  bool obscure=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDBDFAA),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 70,),
              //logo
              Icon(
                  Icons.account_circle_outlined,
                  size: 150,
                  color: Colors.purple ,
              ),
              const SizedBox(height: 20,),
              //karşılama yazısı
              Text(
                "Hoşgeldiniz!",
                style: TextStyle(color: Colors.black54,
                fontSize: 16,),
              ),
              const SizedBox(height: 20,),
              //kullanıcı adı
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: TextField(
              controller: usernameController,
              obscureText: false,
              decoration: InputDecoration(
                //**** HATIRLATMA öne bir ikon ekle
                  prefix: SizedBox(width: 20,),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(40),
                  ),


                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: "mailim@mail.com",

              ),
            ),
          ),
              const SizedBox(height: 20,),
              //şifre
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: TextField(
              controller: passwordController,
              obscureText: obscure,
              decoration: InputDecoration(
                  prefix: SizedBox(width: 20,),
                  suffixIcon: GestureDetector(
                    onTap:(){
                      setState(() {
                        obscure=!obscure;
                      });
                    },
                    // şifre görünürlük kontrol
                    child: Icon(
                        obscure ?
                        Icons.visibility_off:Icons.visibility),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: "Şifre"

              ),
            ),
          ),
              //şifremi unuttum
              const SizedBox(height: 20,),
              Text("Şifremi Unuttum.", style: TextStyle(color: Colors.black54),)
              //giriş
              //google ile devam et
              //kayıt ol
            ],
          ),
        ),
      ),
    );
  }
}
