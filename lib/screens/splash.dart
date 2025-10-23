import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/ornament-top.png'),
            Image.asset('assets/images/logo.png'),
            Image.asset('assets/images/ornament-bottom.png')
          ],
        )
    );
  }
}