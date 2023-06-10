// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animation/gen/assets.gen.dart';

class MoveInDifferentDirections extends StatefulWidget {
  const MoveInDifferentDirections({super.key});

  @override
  State<MoveInDifferentDirections> createState() =>
      _MoveInDifferentDirectionsState();
}

class _MoveInDifferentDirectionsState extends State<MoveInDifferentDirections> {
  double bottom = 0;
  double left = 150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                bottom += 30;
                left += 30;
              });
            },
            child: const Text("اجرا")),
      ),
      body: Stack(children: [
        Container(
          color: Colors.black87,
        ),
        AnimatedPositioned(
            curve: Curves.bounceIn,
            bottom: bottom,
            left: left,
            duration: const Duration(seconds: 4),
            child: Assets.images.spaceship.image(height: 40, width: 40))
      ]),
    );
  }
}
