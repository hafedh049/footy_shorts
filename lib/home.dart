import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:footy_shorts/utils/globals.dart';
import 'package:footy_shorts/views/screens/highlight_selector.dart';
import 'package:footy_shorts/views/screens/reservation.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _screensController = PageController();

  final Map<int, Widget> _screens = <int, Widget>{
    0: const Resersvation(),
    1: const VideoSelector(),
  };

  @override
  void dispose() {
    _screensController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: gray.withOpacity(.1),
        onTabChange: (int index) => _screensController.jumpToPage(index),
        selectedIndex: currentPage,
        rippleColor: gray,
        hoverColor: gray,
        haptic: true,
        tabBorderRadius: 15,
        curve: Curves.linear,
        duration: 500.ms,
        gap: 8,
        activeColor: teal,
        iconSize: 25,
        tabBackgroundColor: teal.withOpacity(.1),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        tabs: const <GButton>[
          GButton(icon: FontAwesome.paperclip, text: 'Reservation'),
          GButton(icon: FontAwesome.highlighter, text: 'Edit'),
          GButton(icon: Bootstrap.clock_history, text: 'Highlights'),
        ],
      ),
      body: PageView.builder(controller: _screensController, itemCount: 3, itemBuilder: (BuildContext context, int index) => _screens[index]),
    );
  }
}
