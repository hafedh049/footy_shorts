import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:footy_shorts/utils/globals.dart';
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
              viewportFraction: 1,
              height: MediaQuery.sizeOf(context).height * .6,
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: 2.seconds,
              autoPlayAnimationDuration: 2.seconds,
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeFactor: 0,
            ),
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              return Image.asset("assets/pictures/football/${itemIndex + 1}.jpg", fit: BoxFit.cover);
            },
          ),
          Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.sizeOf(context).height * .4),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(userLocalSettings!.get("first_time") ? "Welcome" : "Welcome\nBack", style: const TextStyle(fontSize: 24, color: white, fontWeight: FontWeight.w500)),
                        const Spacer(),
                        Container(padding: const EdgeInsets.all(16)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
