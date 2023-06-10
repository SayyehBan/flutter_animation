// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AnimationHideOrShow extends StatefulWidget {
  const AnimationHideOrShow({super.key});

  @override
  State<AnimationHideOrShow> createState() => _AnimationHideOrShowState();
}

class _AnimationHideOrShowState extends State<AnimationHideOrShow> {
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                opacity = opacity == 1 ? 0 : 1;
              });
            },
            child: const Text("اجرا")),
      ),
      body: Center(
          child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: opacity,
              child: Container(width: 100, height: 100, color: Colors.blue))),
    );
  }
}
