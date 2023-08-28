import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:loja_virtual/models/user_model.dart';

import '../helpers/firebase_errors.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  User? currentUser;

  bool _loading = false;
  bool get loading => _loading;

  Future signIn(
      {required UserModel user,
      required Function onFail,
      required Function onSuccess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);

      currentUser = result.user;
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString('${e.code}'));
    }
    loading = false;
  }

  Future<void> signUp(
      {UserModel? userModel, Function? onFail, Function? onSuccess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.createUserWithEmailAndPassword(
          email: userModel!.email!, password: userModel.password!);
      userModel.id = result.user!.uid;
      await userModel.saveData();

      onSuccess!();
    } on FirebaseAuthException catch (e) {
      onFail!(getErrorString(e.code));
    }
    loading = false;
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null) {
        currentUser = user;
        debugPrint(currentUser!.uid);
      }
      notifyListeners();
    });
  }
}
