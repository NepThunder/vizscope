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
        title: const Text("Schedule Details"),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // ScheduleHeader(),
          SizedBox(height: 20),
          ScheduleDropdown(),
        ],
      ),
    );
  }
}

// class ScheduleHeader extends StatelessWidget {
//   const ScheduleHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       decoration: BoxDecoration(
//         color: Colors.grey[800],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: const Text(
//         'Schedule Details',
//         style: TextStyle(
//           color: AppColor.textColor,
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

class ScheduleDropdown extends StatefulWidget {
  const ScheduleDropdown({super.key});

  @override
  State<ScheduleDropdown> createState() => ScheduleDropdownState();
}

class ScheduleDropdownState extends State<ScheduleDropdown> {
  String? selectedTask;

  final List<String> scheduleTasks = [
    'Pre-Renovation Planning',
    'Dismantle/pre execution Works',
    'Plumbing / Electrical / HVAC',
    'Interior Finishes',
    'Painting',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.containerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: selectedTask,
          dropdownColor: AppColor.containerColor,
          hint: const Text(
            'Pre-Renovation Planning',
            style: TextStyle(color: AppColor.textColor, fontSize: 16),
          ),
          icon: const Icon(
            size: 30,
            Icons.arrow_drop_down,
            color: AppColor.textColor,
          ),
          style: const TextStyle(
            color: AppColor.textColor,
          ),
          items: scheduleTasks.map((String task) {
            return DropdownMenuItem<String>(
              value: task,
              child: Text(
                task,
                style: const TextStyle(color: AppColor.textColor, fontSize: 16),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedTask = newValue;
            });
          },
        ),
      ),
    );
  }
}
