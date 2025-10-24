import 'package:flutter/material.dart';
import 'package:shop_amlak/screens/bottom_navigation_screen.dart'; // مسیر صحیح فایل رو بنویس

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Amlak',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigationScreen(), // اینجا مشخص می‌کنی چه صفحه‌ای اول باز بشه
    );
  }
}
