import 'package:cloud_firestore/cloud_firestore.dart';

class SectionModel {
  String? name;
  String? type;

  SectionModel.fromDocument(DocumentSnapshot document) {
    name = document.get('name') as String;
    type = document.get('type') as String;
  }
}
