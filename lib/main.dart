import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Esse comando inicializa o servidor
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());

  //FirebaseFirestore.instance cria uma instancia do App inteiro
  FirebaseFirestore.instance.collection('texte').add({'text': 'text'});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
