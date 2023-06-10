// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DedicateAnimations extends StatefulWidget {
  const DedicateAnimations({super.key});

  @override
  State<DedicateAnimations> createState() => _DedicateAnimationsState();
}

class _DedicateAnimationsState extends State<DedicateAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<double> _rotateAnimate = Tween<double>(
    begin: 0,
    end: 10,
  ).animate(_controller);
  late final Animation<double> _opacityAnimate = Tween<double>(
    begin: 0.2,
    end: 1.0,
  ).animate(_controller);
  late final Animation<double> _containerAnimate = Tween<double>(
    begin: 10,
    end: 200,
  ).animate(_controller);
  late final Animation<double> _borderRadiusAnimate = Tween<double>(
    begin: 0,
    end: 30,
  ).animate(_controller);
  late final Animation<Color?> _colorAnimate = ColorTween(
    begin: Colors.pink,
    end: Colors.blue,
  ).animate(_controller);
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotateAnimate.value,
              child: Opacity(
                opacity: _opacityAnimate.value,
                child: Container(
                  height: _containerAnimate.value,
                  width: _containerAnimate.value,
                  decoration: BoxDecoration(
                      color: _colorAnimate.value,
                      borderRadius:
                          BorderRadius.circular(_borderRadiusAnimate.value)),
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
