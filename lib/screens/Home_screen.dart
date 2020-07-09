import 'package:flutter/material.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:version1/animations/bottomNavigationAnimation.dart';

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
        'title': 'HOME',
      },
      {
        'page': Page3(),
        'title': 'Addpost',
      },
      {
        'page': Page2(),
        'title': 'intern',
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
    return WillPopScope(
      onWillPop: () async {
        MoveToBackground.moveTaskToBack();
        return false;
      },
      child: Scaffold(
          body: _pages[_selectedPageIndex]['page'],
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: _selectedPageIndex,
            onChange: _selectPage,
            backgroundColor: Colors.white,
            children: [
              CustomBottomNavigationItem(
                color: Colors.blue[900],
                icon: Icons.home,
                label: 'Home',
              ),
              CustomBottomNavigationItem(
                color: Colors.blue[900],
                icon: Icons.add_circle_outline,
                label: 'Add',
              ),
              CustomBottomNavigationItem(
                color: Colors.blue[900],
                icon: Icons.people,
                label: 'Intern',
              ),
              

            ],
          )
      ),
    );
  }
}
