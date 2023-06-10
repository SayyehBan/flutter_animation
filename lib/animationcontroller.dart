import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/gen/assets.gen.dart';

class AnimationBuildercontroller extends StatefulWidget {
  const AnimationBuildercontroller({super.key});

  @override
  State<AnimationBuildercontroller> createState() =>
      _AnimationBuildercontrollerState();
}

class _AnimationBuildercontrollerState extends State<AnimationBuildercontroller>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isLiked = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    // _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(
                    width: 8,
                  ),
                  Text("پست")
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Assets.images.kianPerFlak.image(height: 24),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text("کیان پیرفلک"),
                    const Expanded(child: SizedBox()),
                  ],
                )),
            Assets.images.flutter.image(
                fit: BoxFit.cover,
                height: 350,
                width: MediaQuery.of(context).size.width),
            Row(
              children: [
                AnimatedBuilder(
                  animation: CurvedAnimation(
                      parent: _animationController, curve: Curves.bounceInOut),
                  builder: (context, child) {
                    return IconButton(
                        onPressed: () {
                          if (isLiked) {
                            isLiked = false;
                            _animationController.reverse();
                          } else {
                            isLiked = true;
                            if (!_animationController.isCompleted) {
                              _animationController.forward();
                            }
                          }
                        },
                        icon: isLiked
                            ? Opacity(
                                opacity: _animationController.value !=
                                        _animationController.lowerBound
                                    ? _animationController.value
                                    : 1,
                                child: Icon(
                                  CupertinoIcons.heart_fill,
                                  color: Colors.red,
                                  size: _animationController.value !=
                                          _animationController.lowerBound
                                      ? 24 * _animationController.value
                                      : 24,
                                ),
                              )
                            : Opacity(
                                opacity: _animationController.value !=
                                        _animationController.lowerBound
                                    ? _animationController.value
                                    : 1,
                                child: Icon(
                                  CupertinoIcons.heart,
                                  color: Colors.black,
                                  size: _animationController.value !=
                                          _animationController.lowerBound
                                      ? 24 * _animationController.value
                                      : 24,
                                ),
                              ));
                  },
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.bubble_left,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.arrow_right,
                      color: Colors.black,
                    )),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
