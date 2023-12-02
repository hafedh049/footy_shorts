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
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
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
