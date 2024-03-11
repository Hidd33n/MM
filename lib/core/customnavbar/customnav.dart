import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mm/presentation/home/screens/homescreen.dart';
import 'package:mm/presentation/profile/screens/profilescreen.dart';
import 'package:mm/presentation/search/screens/searchscreen.dart';

class CustomNav extends StatefulWidget {
  @override
  _CustomNavState createState() => _CustomNavState();
}

class _CustomNavState extends State<CustomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10.0),
        child: CustomNavigationBar(
          iconSize: 26,
          selectedColor: Colors.white,
          strokeColor: const Color.fromARGB(255, 150, 118, 118),
          unSelectedColor: Colors.grey[800],
          backgroundColor: Colors.grey,
          borderRadius: Radius.circular(100.0),
          isFloating: true,
          blurEffect: true,
          opacity: 8.0,
          items: [
            CustomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "home",
                style: Theme.of(context).textTheme.displayLarge,
              ).tr(),
            ),
            CustomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text("search",
                        style: Theme.of(context).textTheme.displayLarge)
                    .tr()),
            CustomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle_outlined),
                title: Text("profile",
                        style: Theme.of(context).textTheme.displayLarge)
                    .tr()),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
