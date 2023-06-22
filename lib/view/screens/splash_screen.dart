import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Scaffold build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "SPLASH",
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}
