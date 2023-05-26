import 'package:ceramic_shop/view/cart.dart';
import 'package:ceramic_shop/view/categories.dart';
import 'package:ceramic_shop/view/home_screen.dart';
import 'package:ceramic_shop/view/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'page':  HomeScreen(), 'title': 'Home Screen'},
    {'page':  CategoriesScreen(), 'title': 'Categories Screen'},
    {'page':  CartScreen(), 'title': 'Cart Screen'},
    {'page':  UserScreen(), 'title': 'User Screen'},
  ];

  int _selectIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[_selectIndex]['title']),
      // ),
      body: _pages[_selectIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
        selectedItemColor: _isDark ? Colors.black87 : Colors.lightBlue[200],
        currentIndex: _selectIndex,
        onTap: _selectedPage,
        items: [
          BottomNavigationBarItem(
              icon:
                  Icon(_selectIndex == 0 ? IconlyBold.home : IconlyLight.home),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(_selectIndex == 1
                  ? IconlyBold.category
                  : IconlyLight.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(_selectIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(
                  _selectIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
              label: 'User'),
        ],
      ),
    );
  }
}
