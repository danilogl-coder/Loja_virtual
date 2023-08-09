import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual/models/user_model.dart';

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future signIn(UserModel user) async {
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      debugPrint(result.user!.uid);
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}
