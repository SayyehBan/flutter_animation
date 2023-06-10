// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animation/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScaleAnimation extends StatefulWidget {
  const ScaleAnimation({super.key});

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation> {
  double scale = 4;
  bool click = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(24),
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (click) {
                    click = false;
                    scale -= 1;
                  } else {
                    click = true;
                    scale += 1;
                  }
                });
              },
              child: const Text("اجرا")),
        ),
        body: Center(
          child: AnimatedScale(
            duration: const Duration(seconds: 2),
            scale: scale,
            curve: click ? Curves.bounceIn : Curves.bounceOut,
            child: SvgPicture.asset(
              Assets.images.basketball,
              height: 100,
            ),
          ),
        ));
  }
}
