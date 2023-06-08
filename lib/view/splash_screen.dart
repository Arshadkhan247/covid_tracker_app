import 'dart:async';

import 'package:covid_tracker_app/View/world_states_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WorldStatesScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: const SizedBox(
                    width: 200.0,
                    height: 200.0,
                    child: Center(
                      child: Image(
                        image: AssetImage('assets/virus.png'),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .08),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Covid-19\nTracker App',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
