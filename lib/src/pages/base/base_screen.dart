import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/cart/cart_tab.dart';
import 'package:greengrocer/src/pages/home/home_tab.dart';
import 'package:greengrocer/src/pages/profile/profile_tab.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int curretIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          const HomeTab(),
          const CartTab(),
          Container(
            color: Colors.blue,
          ),
          const ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: curretIndex,
          onTap: (index) {
            setState(() {
              curretIndex = index;
              pageController.jumpToPage(index);
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withAlpha(100),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: 'Carrinho',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: 'Pedidos',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_add_outlined,
              ),
              label: 'Perfil',
            ),
          ]),
    );
  }
}
