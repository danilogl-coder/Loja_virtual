import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:loja_virtual/screen/base/base_screen.dart";
import "package:provider/provider.dart";

import "firebase_options.dart";
import "models/user_manager.dart";

void main() async {
// Esse comando esta garantindo inicialização correta antes do flutter iniciar
  WidgetsFlutterBinding.ensureInitialized();
// Esse comando inicializa o servidor
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => UserManager(),
      child: MaterialApp(
        title: 'Loja virtual',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
          scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 4, 125, 141),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BaseScreen(),
      ),
    );
  }
}
