import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:shop_amlak/screens/first_screen.dart';
import 'package:shop_amlak/screens/second_screen.dart';
import 'package:shop_amlak/screens/third_screen.dart';
import 'package:shop_amlak/tools/colors.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  /// Screens for each tab
  List<Widget> _buildScreens() {
    return [FirstScreen(), FirstScreen(), SecondScreen(), ThirdScreen()];
  }

  /// Bottom navigation items
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        inactiveIcon: const Icon(Icons.home_outlined),
        activeColorPrimary: redColor,
        inactiveColorPrimary: greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.location_on),
        inactiveIcon: const Icon(Icons.location_on_outlined),
        activeColorPrimary: redColor,
        inactiveColorPrimary: greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.calendar_month_rounded),
        inactiveIcon: const Icon(Icons.calendar_month_outlined),
        activeColorPrimary: redColor,
        inactiveColorPrimary: greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        inactiveIcon: const Icon(Icons.person_outline_rounded),
        activeColorPrimary: redColor,
        inactiveColorPrimary: greyColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Colors.grey.shade900,
      confineToSafeArea: true,
      hideNavigationBarWhenKeyboardAppears: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      navBarStyle:
          NavBarStyle.style12, // You can change this for different looks
    );
  }
}
