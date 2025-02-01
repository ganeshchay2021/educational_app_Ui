import 'package:educational_app_ui/screens/features/features.dart';
import 'package:educational_app_ui/screens/learning/learning.dart';
import 'package:educational_app_ui/screens/setting/settings.dart';
import 'package:educational_app_ui/screens/wishlist/wishlist.dart';
import 'package:educational_app_ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class EducationalAppMainPage extends StatefulWidget {
  const EducationalAppMainPage({super.key});

  @override
  State<EducationalAppMainPage> createState() => _EducationalAppMainPageState();
}

class _EducationalAppMainPageState extends State<EducationalAppMainPage> {
  List<Widget> pages = const [
    FeaturesScreen(),
    LearningScreens(),
    WishlistScreen(),
    SettingsScreens()
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        elevation: 0,
        selectedFontSize: 16,
        unselectedFontSize: 15,
        iconSize: 30,
        selectedItemColor: primaryColor1,
        items: const [
          BottomNavigationBarItem(
            label: "Features",
            icon: Icon(Icons.star),
          ),
          BottomNavigationBarItem(
            label: "Learnings",
            icon: Icon(Icons.play_circle_outline_rounded),
          ),
          BottomNavigationBarItem(
            label: "Wishlist",
            icon: Icon(Icons.favorite_outline_rounded),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings_outlined),
          ),
        ],
      ),
    );
  }
}
