import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:footy_shorts/utils/globals.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    if (userLocalSettings!.get("first_time")) {
      userLocalSettings!.put("first_time", false);
    }
    super.dispose();
  }

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
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: gray, borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(userLocalSettings!.get("first_time") ? "Welcome" : "Welcome\nBack", style: const TextStyle(fontSize: 24, color: white, fontWeight: FontWeight.w500)),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(color: white.withOpacity(.2), shape: BoxShape.circle),
                            padding: const EdgeInsets.all(16),
                            child: Icon(FontAwesome.hands, color: yellow, size: 25),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                controller: _emailController,
                                style: TextStyle(color: gray.withOpacity(.5), fontSize: 16, fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(width: .5, color: gray.withOpacity(.5))),
                                  hintText: "Email",
                                  contentPadding: const EdgeInsets.all(8),
                                  alignLabelWithHint: true,
                                  focusColor: gray,
                                  hintStyle: TextStyle(color: gray.withOpacity(.5), fontSize: 16, fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
