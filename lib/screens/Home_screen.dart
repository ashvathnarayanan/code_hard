import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../pages/page_1.dart';
import '../pages/page_2.dart';
import '../pages/page_3.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': Page1(),
        'title': 'Categories',
      },
      {
        'page': Page2(),
        'title': 'Your Favorites',
      },
      {
        'page': Page3(),
        'title': 'Cart',
      },
      {
        'page': Page2(),
        'title': 'bla',
      },
      {
        'page': Page2(),
        'title': 'Cst',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              title: Text(""),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(title: Text(""), icon: Icon(Icons.people)),
            BottomNavigationBarItem(
                title: Text(""), icon: Icon(Icons.add_circle_outline)),
            BottomNavigationBarItem(
                title: Text(""), icon: Icon(Icons.notifications)),
            BottomNavigationBarItem(
                title: Text(""), icon: Icon(Icons.work)),
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
        ));
  }
}
