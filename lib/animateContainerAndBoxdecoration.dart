// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AnimateContainerAndBoxdecoration extends StatefulWidget {
  const AnimateContainerAndBoxdecoration({super.key});

  @override
  State<AnimateContainerAndBoxdecoration> createState() =>
      _AnimateContainerAndBoxdecorationState();
}

class _AnimateContainerAndBoxdecorationState
    extends State<AnimateContainerAndBoxdecoration> {
  Color color = Colors.pink;
  double borderRadius = 30;
  double height = 100;
  double width = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                color = Colors.blue;
                borderRadius = 200;
                height = 300;
                width = 90;
              });
            },
            child: const Text("اجرا")),
      ),
      body: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          height: height,
          width: width,
          duration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
