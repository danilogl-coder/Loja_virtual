import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/models/section_model.dart';

class HomeManager {
  HomeManager() {
    _loadSections();
  }
  List<SectionModel> sections = [];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> _loadSections() async {
    firestore.collection('home').snapshots().listen((snapshot) {
      sections.clear();
      for (final DocumentSnapshot document in snapshot.docs) {
        sections.add(SectionModel.fromDocument(document));
      }
      print(sections);
    });
  }
}
