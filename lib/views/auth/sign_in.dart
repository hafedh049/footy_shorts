import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          InfiniteCarousel.builder(
            itemCount: 10,
            itemExtent: 120,
            center: true,
            anchor: 0.0,
            velocityFactor: 0.2,
            onIndexChanged: (index) {},
            controller: controller,
            axisDirection: Axis.horizontal,
            loop: true,
            itemBuilder: (context, itemIndex, realIndex) {},
          ),
        ],
      ),
    );
  }
}
