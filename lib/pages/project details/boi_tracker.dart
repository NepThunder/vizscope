import 'package:flutter/material.dart';
import 'package:vizscope/colors.dart';

class BOITracker extends StatefulWidget {
  const BOITracker({super.key});

  @override
  State<BOITracker> createState() => _BOITrackerstate();
}

class _BOITrackerstate extends State<BOITracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        foregroundColor: AppColor.textColor,
        backgroundColor: Colors.transparent,
        title: const Text("BOI Tracker"),
      ),
      body: Container(),
    );
  }
}
