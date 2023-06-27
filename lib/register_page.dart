import 'package:bootcamp_goua/sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
//textboxları ayırmak için
  final usernameController= TextEditingController();
  final passwordController= TextEditingController();
  final confirmpasswordController= TextEditingController();
//şifre bölümü button kontrol
  bool obscure=true;
  //kayıt
  void signUp() async {
   /* showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(),
      );
    },); */
    // hata mesajına göre popup
    void emptyEmail(){
      showDialog(context: context, builder: (context){
        return const AlertDialog(title: Center(child: Text("Lütfen geçerli bir mail giriniz!",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),)));
      },);
    }
    void unMatchPassw(){
      showDialog(context: context, builder: (context){
        return const AlertDialog(title: Center(child: Text("Şifreler Eşleşmedi!",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),)));
      },);
    }
    void invalidEmail(){
      showDialog(context: context, builder: (context){
        return const AlertDialog(title: Center(child: Text("Lütfen geçerli bir mail giriniz!",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),)));
      },);
    }
    void emptyPassw(){
      showDialog(context: context, builder: (context){
        return const AlertDialog(title: Center(child: Text("Lütfen geçerli bir mail giriniz!",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),)));
      },);
    }
    //kayıt ol
    try{
      //iki şifre aynı mı kontrol
      if(passwordController.text==confirmpasswordController.text){
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: usernameController.text,
              password: passwordController.text
          );
          //Navigator.pop(context);
        }
        else if(passwordController.text.isEmpty==true || confirmpasswordController.text.isEmpty==true){
          emptyPassw();
        }
        else if(usernameController.text.isEmpty==true){
          emptyEmail();
        }
        else {
          unMatchPassw();
        }
      // yükleme ekranı için

    } on FirebaseAuthException catch (error){
      //Navigator.pop(context);
      if(error.code=="invalid-email"){
        invalidEmail();
      }

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false, // altta hata bannerı çıkmaması için ama singlechildscrollview ile gerek kalmadı düzeldi
      backgroundColor: Color(0xFFDBDFAA),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                const SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: TextField(
                    controller: confirmpasswordController,
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
                        hintText: "Şifreyi Onayla"

                    ),
                  ),
                ),
                //şifremi unuttum
                const SizedBox(height: 15,),
                //*** Gesture ile button işlevi ver
                //Text("Şifremi Unuttum.", style: TextStyle(color: Colors.black54),),
                //giriş
                SizedBox(height: 15,),
                SignUp(
                  onTap: signUp,
                ),
                const SizedBox(
                  height: 25,
                ),
                //google ile devam et
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("ya da Google ile devam et", style: TextStyle(color: Colors.blueGrey),),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                //google giriş
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 45,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white30,
                  ),
                  child: Image.asset("lib/images/google0.png"),),


                SizedBox(height: 25,),
                //kayıt ol
                Padding(
                  padding: const EdgeInsets.only(top:4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Üyemiz misin?",style: TextStyle(color:Colors.black54),),
                      SizedBox(width: 5,),
                      GestureDetector(
                          onTap: widget.onTap,
                          child: Text("Giriş Yap",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}