import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/models/user_model.dart';

import '../helpers/firebase_errors.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? currentUser;
  UserModel? userModel;

  bool _loading = false;
  bool get loading => _loading;

  bool get isLogedIn => userModel != null;

  Future signIn(
      {required UserModel user,
      required Function onFail,
      required Function onSuccess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);

      await _loadCurrentUser(firebaseUser: result.user);

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
      this.userModel = userModel;
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

  void signOut() {
    auth.signOut();
    userModel = null;
    notifyListeners();
  }

  Future<void> _loadCurrentUser({User? firebaseUser}) async {
    auth.authStateChanges().listen((User? user) async {
      currentUser = firebaseUser ?? user;
      if (user != null) {
        final DocumentSnapshot docUser =
            await firestore.collection('users').doc(currentUser!.uid).get();

        userModel = UserModel.fromDocument(docUser);
        print(userModel!.name);

        final docAdmin =
            await firestore.collection('admins').doc(userModel!.id).get();
        if (docAdmin.exists) {
          userModel!.admin = true;
        }

        print(userModel!.admin);

        notifyListeners();
      }
    });
  }

  bool get adminEnabled => userModel != null && userModel!.admin;
}
