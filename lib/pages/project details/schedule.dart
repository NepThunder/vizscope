import 'package:flutter/material.dart';
import 'package:vizscope/colors.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        foregroundColor: AppColor.textColor,
        backgroundColor: Colors.transparent,
        title: const Text("Schedule"),
      ),
      body: Container(),
    );
  }
}
