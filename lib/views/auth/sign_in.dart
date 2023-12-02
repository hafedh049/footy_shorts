import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            itemCount: 4,
            options: CarouselOptions(
              height: MediaQuery.sizeOf(context).height * .5,
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: 2.seconds,
              autoPlayAnimationDuration: 2.seconds,
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeFactor: 0,
              scrollDirection: Axis.horizontal,
            ),
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              return Image.asset("assets/pictures/football/${itemIndex + 1}.jpg", fit: BoxFit.cover);
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
