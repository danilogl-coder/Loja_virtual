import 'package:flutter/material.dart';
import 'package:loja_virtual/commom_components/custom_drawer/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 255, 119, 146),
              Color.fromARGB(255, 255, 188, 217)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/cart');
                      },
                      color: Colors.white,
                      icon: const Icon(Icons.shopping_cart))
                ],
                snap: true,
                floating: true,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text("Loja do danilo"),
                  centerTitle: true,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 2000,
                  width: 200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
