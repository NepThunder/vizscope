import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  void _checkUserStatus() async {
    var duration = const Duration(seconds: 3);

    await Future.delayed(duration);

    if (!mounted) return;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/authentication');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildAnimation(),
    );
  }

  Widget _buildAnimation() {
    String currentYear = DateTime.now().year.toString();

    return Stack(
      children: [
        Center(
          child: Lottie.asset(
            "assets/animations/SplashScreenAnimation.json",
            height: 150,
            width: 150,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              '© $currentYear',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(184, 0, 0, 0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
