// @dart=2.9
import 'package:flutter/material.dart';
import 'package:free_wifi_hotspots/constant.dart';
import 'package:free_wifi_hotspots/screens/home_page.dart';
import 'package:free_wifi_hotspots/screens/more.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  final List<Widget> _children = [
    HomePage(),
    More(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: colorbackground,
        title: const Text('Speedy WiFi Hotspots',
            style: TextStyle(
                color: dfFontColor,
                fontSize: dfAppFont,
                fontWeight: FontWeight.bold)),
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.white.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300],
              hoverColor: Colors.grey[100],
              gap: 40,
              activeColor: Colors.white,
              iconSize: 35,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: colorbackground,
              color: Colors.white,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.more_horiz,
                  text: 'More',
                ),
                // GButton(
                //   icon: Icons.search,
                //   text: 'Search',
                // ),
                // GButton(
                //   icon: Icons.person,
                //   text: 'Profile',
                // ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: onTabTapped,
            ),
          ),
        ),
      ),
    );
  }
}
