import 'package:finance_guru/screens/dashboard_screens/investment_screen.dart';
import 'package:finance_guru/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../screens/dashboard_screens/ask_guru_screen.dart';
import '../screens/dashboard_screens/home_screen.dart';
import '../screens/dashboard_screens/profile_screen.dart';

class ControllerScreen extends StatefulWidget {
  const ControllerScreen({super.key});

  @override
  State<ControllerScreen> createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  int currentIndex = 0;
  final List<Widget> _children = [
    const HomeScreen(),
    const InvestmentScreen(),
    const AskGuruScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: CustomBottomBar(
          currentIndex: currentIndex,
          onTabSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}
