import 'package:flutter/material.dart';
class SignIn extends StatelessWidget {
  const SignIn({super.key,required this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 45),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.purple,
        ),
        child: const Center(child: Text("Giriş",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),)),
      ),
    );
  }
}
