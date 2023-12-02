import 'package:carousel_slider/carousel_slider.dart';
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
          CarouselSlider.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Container(
              child: Text(itemIndex.toString()),
            ),
          ),
          InfiniteCarousel.builder(
            itemCount: 4,
            itemExtent: MediaQuery.sizeOf(context).width,
            velocityFactor: 0.2,
            axisDirection: Axis.horizontal,
            loop: true,
            itemBuilder: (BuildContext context, int itemIndex, int realIndex) {
              return Image.asset(
                "assets/pictures/football/${itemIndex + 1}.jpg",
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
