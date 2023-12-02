import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final ScrollController _carousselController = ScrollController();

  @override
  void dispose() {
    _carousselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          InfiniteCarousel.builder(
            itemCount: 4,
            itemExtent: MediaQuery.sizeOf(context).width,
            center: true,
            velocityFactor: 0.2,
            onIndexChanged: (index) {},
            controller: _carousselController,
            axisDirection: Axis.horizontal,
            loop: true,
            itemBuilder: (BuildContext context, int itemIndex, int realIndex) {
              return Image.asset(
                "assets/pictures/football/$itemIndex.jpg",
                fit: BoxFit.cover,
                height: MediaQuery.sizeOf(context).height * .5,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[],
            ),
          ),
        ],
      ),
    );
  }
}
