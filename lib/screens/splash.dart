import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
              'assets/images/top-linear.png'
          ),
          Image.asset(
              'assets/images/logo.png',
              width: 174
          ),
          Image.asset(
              'assets/images/bottom.png'
          )
        ],
      ),
    );
  }
}