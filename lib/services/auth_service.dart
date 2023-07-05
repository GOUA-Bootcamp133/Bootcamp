import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  signInWithGoogle() async {

    // google ile giriş için web sayfasını açma
    final GoogleSignInAccount? gUser= await GoogleSignIn().signIn();
    // giriş bilgilerini kullanıcıdan almak
    final GoogleSignInAuthentication gAuth= await gUser!.authentication;

    //yeni kullanıcı oluştur
    final credential=GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    //giriş
    return await FirebaseAuth.instance.signInWithCredential(credential);



  }
}