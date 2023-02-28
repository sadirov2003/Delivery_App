import 'package:flutter/material.dart';
import 'package:flutter_lavash/src/auth/verify_phone_number.dart';
import 'package:flutter_lavash/src/data/food_data.dart';
import 'package:flutter_lavash/src/pages/favorites.dart';
import 'package:flutter_lavash/src/pages/menu.dart';
import 'package:flutter_lavash/src/pages/orders.dart';
import 'package:flutter_lavash/src/pages/profile.dart';
import 'package:flutter_lavash/src/widgets/appBar_widget.dart';
import 'package:flutter_lavash/src/widgets/food_card.dart';
import 'package:flutter_lavash/src/widgets/foods.dart';
import 'package:flutter_lavash/src/widgets/search_field.dart';

import '../widgets/register_with_phonenumber.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;

  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget(index: _selectedTab),
        body: IndexedStack(
          index: _selectedTab,
          children: [
            Menu(),
            Orders(),
            Favorites(),
            Profile(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          type: BottomNavigationBarType.fixed,
          iconSize: 28,
          selectedLabelStyle: const TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 15),
          unselectedLabelStyle: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_open, color: Colors.black54),
              label: 'Меню',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.black54),
              label: 'Заказ',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.bookmark, color: Colors.black54),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black54),
              label: 'Профиль',
            ),
          ],
          onTap: onSelectedTab,
        ),
      ),
    );
  }
}
