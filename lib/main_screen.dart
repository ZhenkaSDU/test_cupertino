import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_cupertino/features/profile/profile_screen.dart';
import 'features/home/home_screen.dart';


class MainScreen extends StatefulWidget{
  const MainScreen({super.key, required this.email, required this.nickname});
  final String email;
  final String nickname;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.map)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled)),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return const HomeScreen();
              case 1:
                return const HomeScreen();
              case 2:
                return const HomeScreen();
              case 3:
                return ProfileScreen(email: widget.email, nickname: widget.nickname,);
              default:
                return const HomeScreen();
            }
          },
        );
      },
    );
  }
}