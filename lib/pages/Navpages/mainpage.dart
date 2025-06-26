import 'package:flutter/material.dart';
import 'package:travel_app/pages/Navpages/Baritempage.dart';
import 'package:travel_app/pages/Homepage.dart';
import 'package:travel_app/pages/Navpages/mypage.dart';
import 'package:travel_app/pages/Navpages/searchpage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List pages = [
    Homepage(),
    Baritempage(),
    Searchpage(),
    Mypage()

  ];
  int currentIndexs = 0;
  void onTap(int index){
    setState(() {
      currentIndexs = index;
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndexs] ,
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndexs,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem( label: "Home", icon: Icon(Icons.apps)),
          BottomNavigationBarItem( label: "Bar", icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem( label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem( label: "My", icon: Icon(Icons.person)),
        ]),
      
    );
  }
}