import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _xAnimationController;
  late AnimationController _yAnimationController;
  late AnimationController _zAnimationController;
  late Tween<double> _animation;
  @override
  void initState() {
    super.initState();
    _xAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    _yAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    _zAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    _animation = Tween<double>(begin: 0, end: pi * 2);
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
    _xAnimationController
      ..reset()
      ..repeat();

    _yAnimationController
      ..reset()
      ..repeat();

    _zAnimationController
      ..reset()
      ..repeat();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            AnimatedBuilder(
              animation: Listenable.merge([
                _xAnimationController,
                _yAnimationController,
                _zAnimationController,
              ]),
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(_animation.evaluate(_xAnimationController))
                    ..rotateY(_animation.evaluate(_yAnimationController))
                    ..rotateZ(_animation.evaluate(_zAnimationController)),
                  child: Stack(
                    children: [
                      // back
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..translate(Vector3(0, 0, -100)),
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.blue,
                        ),
                      ),
                      //front
                      Container(
                        color: Colors.red,
                        height: 100,
                        width: 100,
                      ),
                      //left side
                      Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()..rotateY(pi / 2),
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.amber,
                        ),
                      ),
                      //right side
                      Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()..rotateY(-pi / 2),
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.green,
                        ),
                      ),
                      Transform(
                        alignment: Alignment.topCenter,
                        transform: Matrix4.identity()..rotateX(-pi / 2.0),
                        child: Container(
                          color: Colors.black,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      // bottom side
                      Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()..rotateX(pi / 2.0),
                        child: Container(
                          color: Colors.brown,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
