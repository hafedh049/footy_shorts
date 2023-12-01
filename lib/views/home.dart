import 'package:flutter/material.dart';
import 'package:footy_shorts/views/highlight.dart';
import 'package:footy_shorts/views/reservation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _screensController = PageController();

  final Map<int, Widget> _screens = <int, Widget>{
    0: const Resersvation(),
    1: const VideoHighlight(),
  };

  @override
  void dispose() {
    _screensController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (int index) {},
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) => _screens[index],
      ),
    );
  }
}
