import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class AnimatedSplash extends StatelessWidget {
  const AnimatedSplash({
    Key? key,
    required this.isLoaded,
    required this.height,
    required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final bool isLoaded;
  final double height;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      height: isLoaded ? 0.0 : height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff141414),
        borderRadius: isLoaded
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))
            : null,
      ),
      child: AnimatedOpacity(
        duration: const Duration(seconds: 2),
        opacity: isLoaded ? 0 : 1,
        child: Center(
          child: Lottie.asset(
            "assets/animation/44298-coffee-love.json",
            height: 250,
            controller: _controller,
            onLoaded: (composition) {
              _controller.duration = composition.duration;
              _controller.forward();
            },
          ),
        ),
      ),
    );
  }
}
