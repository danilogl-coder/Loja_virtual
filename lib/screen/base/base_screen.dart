import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../commom_components/custom_drawer/custom_drawer.dart';
import '../../models/page_manager.dart';
import '../login/login_screen.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => PageManager(pageController: pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home'),
            ),
          ),
          LoginScreen(),
          Container(color: Colors.yellow),
          Container(color: Colors.green),
        ],
      ),
    );
  }
}
