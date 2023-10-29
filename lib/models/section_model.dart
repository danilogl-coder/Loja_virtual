import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/models/section_item.dart';

class SectionModel {
  String? name;
  String? type;
  List<SectionItem>? items;

  SectionModel.fromDocument(DocumentSnapshot document) {
    name = document.get('name') as String;
    type = document.get('type') as String;
    items = (document.get('items') as List)
        .map((e) => SectionItem.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  @override
  String toString() {
    return "Section{name: $name, type: $type, items: $items}";
  }
}
