// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animation/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimationOfRotating extends StatefulWidget {
  const AnimationOfRotating({super.key});

  @override
  State<AnimationOfRotating> createState() => _AnimationOfRotatingState();
}

class _AnimationOfRotatingState extends State<AnimationOfRotating> {
  double turns = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                turns = turns == 1 ? 2 : 1;
              });
            },
            child: const Text('اجرا')),
      ),
      body: Stack(alignment: Alignment.center, children: [
        Container(
          color: Colors.black87,
        ),
        SvgPicture.asset(
          Assets.images.men,
          height: 300,
        ),
        AnimatedRotation(
          duration: const Duration(seconds: 2),
          turns: turns,
          child: SvgPicture.asset(
            Assets.images.sibil,
            height: 40,
          ),
        ),
      ]),
    );
  }
}
