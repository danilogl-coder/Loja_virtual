import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.confirmPassword,
  });

  UserModel.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.get('name') as String;
    email = document.get('email') as String;
  }

  String? id;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users/$id');
  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

  CollectionReference get cartReference => firestoreRef.collection('cart');

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
