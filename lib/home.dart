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
        rippleColor: gray, // tab button ripple color when pressed
        hoverColor: gray, // tab button hover color
        haptic: true, // haptic feedback
        tabBorderRadius: 15, // tab button border
        curve: Curves.linear, // tab animation curves
        duration: 500.ms, // tab animation duration
        gap: 8, // the tab button gap between icon and text
        activeColor: teal, // selected icon and text color
        iconSize: 15, // tab button icon size
        tabBackgroundColor: teal.withOpacity(.1), // selected tab background color
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
        tabs: <GButton>[
          GButton(
            icon: FontAwesome.page4,
            text: 'Reservation',
            onPressed: () {},
          ),
          GButton(
            icon: FontAwesome.page4,
            text: 'Highlight',
            onPressed: () {},
          ),
          GButton(
            icon: FontAwesome.page4,
            text: 'Reservation',
            onPressed: () {},
          ),
        ],
      ),
      body: PageView.builder(
        onPageChanged: (int index) {},
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) => _screens[index],
      ),
    );
  }
}
