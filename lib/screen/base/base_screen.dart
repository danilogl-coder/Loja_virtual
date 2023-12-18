import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:loja_virtual/screen/home/home_screen.dart';
import 'package:loja_virtual/screen/products/products_screen.dart';
import 'package:provider/provider.dart';

import '../../commom_components/custom_drawer/custom_drawer.dart';
import '../../models/page_manager.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => PageManager(pageController: pageController),
      child: Consumer<UserManager>(
        builder: (context, userManager, child) => PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const HomeScreen(),
            const ProductsScreen(),
            Scaffold(
              drawer: const CustomDrawer(),
              appBar: AppBar(
                title: const Text('Home3'),
              ),
            ),
            Scaffold(
              drawer: const CustomDrawer(),
              appBar: AppBar(
                title: const Text('Home4'),
              ),
            ),
            if (userManager.adminEnabled) ...[
              Scaffold(
                drawer: const CustomDrawer(),
                appBar: AppBar(
                  title: const Text('Usuarios'),
                ),
              ),
              Scaffold(
                drawer: const CustomDrawer(),
                appBar: AppBar(
                  title: const Text('Pedidos'),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
