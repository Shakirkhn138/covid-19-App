import 'dart:async';

import 'package:c_virus/screen/world_state.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this)..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5),() => Navigator.push(context, MaterialPageRoute(builder: (context) => WorldState())));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedBuilder(
          child: Container(
            height: 200,
            width: 200,
            child: const Center(
              child: Image(image: NetworkImage('https://pngimg.com/uploads/virus/virus_PNG52.png')),
            ),
          ),
            animation: _controller,
            builder: (BuildContext context, Widget? child){
              return Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                child: child,
              );
            }


        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        Align(
            alignment: Alignment.center,
            child: Text('Covid-19\nTracker App', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, ),))
      ],
    );
  }
}
