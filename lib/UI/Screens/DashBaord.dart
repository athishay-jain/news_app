import 'package:flutter/material.dart';
import 'package:news_app/UI/Screens/HomePage.dart';

class DashBoard extends StatefulWidget {
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int naviScreen = 0;

  List<Widget> mScreens = [
    HomePage(),
    Center(
      child: Text("save"),
    ),
    Center(
      child: Text("Profile"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFAFAFA),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            "assets/images/ic_logo.png",
          ),
        ),
        leadingWidth: 160,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.settings,
              size: 28,
            ),
          )
        ],
      ),
      body: mScreens[naviScreen],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff1A73E8),
        currentIndex: naviScreen,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        backgroundColor: Color(0xffFAFAFA),
        iconSize: 28,
        type: BottomNavigationBarType.shifting,
        enableFeedback: true,
        onTap: (value) {
          naviScreen = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: "Saved",
            activeIcon: Icon(Icons.bookmark),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Profile",
            activeIcon: Icon(Icons.person_2),
          ),
        ],
      ),
    );
  }
}
