import 'package:flutter/material.dart';
import 'package:vizscope/colors.dart';

class FCSRefurbishment extends StatefulWidget {
  const FCSRefurbishment({super.key});

  @override
  State<FCSRefurbishment> createState() => _FCSRefurbishmentState();
}

class _FCSRefurbishmentState extends State<FCSRefurbishment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        foregroundColor: AppColor.textColor,
        backgroundColor: Colors.transparent,
        title: const Text("FCS Refurbishment"),
      ),
      body: Container(),
    );
  }
}
