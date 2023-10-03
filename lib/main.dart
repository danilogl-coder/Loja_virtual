import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:loja_virtual/models/cart_manager.dart";
import "package:loja_virtual/models/product.dart";
import "package:loja_virtual/models/product_manager.dart";
import "package:loja_virtual/screen/base/base_screen.dart";
import "package:loja_virtual/screen/cart/cart_screen.dart";
import "package:loja_virtual/screen/login/login_screen.dart";
import "package:loja_virtual/screen/products/product/product_screen.dart";
import "package:loja_virtual/screen/signup/signup_screen.dart";
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        ),
        ProxyProvider<UserManager, CartManager>(
          create: (_) => CartManager(),
          update: (context, userManager, cartManager) =>
              cartManager!..updateUser(userManager),
          lazy: false,
        )
      ],
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
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(builder: (context) => LoginScreen());
            case '/signup':
              return MaterialPageRoute(builder: (context) => SignUpScreen());
            case '/cart':
              return MaterialPageRoute(
                  builder: (context) => const CartScreen());
            case '/product':
              return MaterialPageRoute(
                  builder: (context) => ProductScreen(
                        product: settings.arguments as Product,
                      ));
            case '/base':
            default:
              return MaterialPageRoute(builder: (context) => BaseScreen());
          }
        },
      ),
    );
  }
}
