import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/dimensions.dart';
import 'package:food_app_part1/routes/routes_helper.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward();
    // ignore: unnecessary_new
    animation = new CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(Duration(seconds: 4),() => Get.offNamed(RouteHelper.initial));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(child: Image.asset("assets/logo1.png", width: Dimensions.splashImg,)),
          ),

          //second annimation
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                "assets/logo2.png",
                width: Dimensions.splashImg
              ),
            ),
          )
        ],
      ),
    );
  }
}
