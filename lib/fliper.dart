import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class CoinFlipper extends StatefulWidget {
  const CoinFlipper({Key? key}) : super(key: key);

  @override
  State<CoinFlipper> createState() => _CoinFlipperState();
}

class _CoinFlipperState extends State<CoinFlipper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isCoinHead = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 300), // Shorter duration for high speed
    );
    _animation = Tween(begin: 0.0, end: 5.0)
        .animate(_controller); // 5 rotations in total
  }

  void flipCoin() {
    setState(() {
      _controller.reset();
      _controller.forward();
      isCoinHead = randomizer.nextBool();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RotationTransition(
          turns: _animation,
          child: Image.asset(
            isCoinHead ? "assets/heads.png" : "assets/tails.png",
            width: 200,
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: flipCoin,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          child: const Text("Flip Coin"),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
