import 'package:flutter/material.dart';
//şifre ve kullanıcı adı girişi burada
class TextBox extends StatelessWidget {

//textboxlar arasındaki ayrım için

  final checker;
  final String hintText; //ipucu yazısı
  final bool hide; //şifrenin açıkça görünmemesi için
  const TextBox({
    super.key,
    required this.checker,
    required this.hide,
    required this.hintText,

});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      child: TextField(
        controller: checker,
        obscureText: hide,
        decoration: InputDecoration(
          prefix: SizedBox(width: 20,),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(40),
          ),


          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          suffixIcon: Icon(Icons.remove_red_eye, color: Colors.purpleAccent,)
        ),
      ),
    );
  }
}