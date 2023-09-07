import 'dart:math' show pi;

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _xAnimationController;
  late AnimationController _yAnimationController;
  late AnimationController _zAnimationController;
  late Tween _animation;
  @override
  void initState() {
    super.initState();
    _xAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    _yAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );
    _zAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    );
    _animation = Tween<double>(begin: 0, end: pi / 2);
  }

  @override
  void dispose() {
    _xAnimationController.dispose();
    _yAnimationController.dispose();
    _zAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Stack(
            children: [],
          )
        ],
      )),
    );
  }
}
