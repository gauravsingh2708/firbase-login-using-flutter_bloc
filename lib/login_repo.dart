
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // signIn with email and password
  Future<User> logInWithEmailAndPassword( {String email, String password}) async {
    var result = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return result.user;
  }


}
