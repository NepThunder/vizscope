import 'package:flutter/material.dart';
import 'package:vizscope/colors.dart';

import 'package:vizscope/pages/image_grid_view.dart';
import 'package:vizscope/pages/project%20details/boi_tracker.dart';
import 'package:vizscope/pages/project%20details/fcs_refurbishment.dart';
import 'package:vizscope/pages/project%20details/schedule.dart';
import 'package:vizscope/pages/project%20details/weekly_report.dart';

class ProjectDetails extends StatefulWidget {
  final String projectName;
  const ProjectDetails({super.key, required this.projectName});

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  Map<String, dynamic>? projectDetails;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_image_1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          foregroundColor: AppColor.textColor,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Back",
            style: TextStyle(color: AppColor.textColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: AppColor.containerColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.projectName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColor.secondaryTextColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            color: AppColor.containerColor,
                            child: Image.asset(
                              "assets/dummyImages/dummyimage.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                            height:
                                8), // Space between the image and the button
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ImageGridViewPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.secondarycontainerColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              "More",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      "About Project",
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColor.containerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColor.containerColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 8,
                                  color: AppColor.textColor,
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                    style: TextStyle(color: AppColor.textColor),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Icon(Icons.circle,
                                    size: 8, color: AppColor.textColor),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                      "Nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                      style:
                                          TextStyle(color: AppColor.textColor)),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Icon(Icons.circle,
                                    size: 8, color: AppColor.textColor),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                      "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.",
                                      style:
                                          TextStyle(color: AppColor.textColor)),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Icon(Icons.circle,
                                    size: 8, color: AppColor.textColor),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                      "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.",
                                      style:
                                          TextStyle(color: AppColor.textColor)),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Icon(Icons.circle,
                                    size: 8, color: AppColor.textColor),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                      "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.",
                                      style:
                                          TextStyle(color: AppColor.textColor)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Site Location:",
                              style: TextStyle(
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "1st Main Road, Anandnagar, Hebbal Bengaluru, 560-024",
                              style: TextStyle(color: AppColor.textColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Budget: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColor),
                            ),
                            TextSpan(
                                text: "5,55,55,555 INR",
                                style: TextStyle(color: AppColor.textColor)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Site Manager: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColor),
                            ),
                            TextSpan(
                                text: "Mr. Ravi Kumar",
                                style: TextStyle(color: AppColor.textColor)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Contact: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColor),
                            ),
                            TextSpan(
                                text: "1234567890",
                                style: TextStyle(color: AppColor.textColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      "Project Details",
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColor.containerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    children: [
                      ProjectButton(name: "FCS Refurbishment"),
                      ProjectButton(name: "Schedule page"),
                      ProjectButton(name: "BOI Tracker"),
                      ProjectButton(name: "Weekly report page"),
                    ],
                  ),
                ),
                // const SizedBox(height: 20),
                // Container(
                //   padding: const EdgeInsets.all(12),
                //   decoration: BoxDecoration(
                //     color: Colors.grey[300],
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: const Center(
                //     child: Text(
                //       "Pending Work",
                //       style: TextStyle(
                //         fontSize: 16,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    ); //here remove colon if positioned
  }
}

class ProjectButton extends StatelessWidget {
  final String name;

  const ProjectButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 2,
              spreadRadius: 1,
              offset: const Offset(-4, 8),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: () {
            if (name == "FCS Refurbishment") {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FCSRefurbishment()),
              );
            } else if (name == "Schedule page") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Schedule()),
              );
            } else if (name == "BOI Tracker") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BOITracker()),
              );
            } else if (name == "Weekly report page") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WeeklyReport()),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            // backgroundColor: const Color.fromRGBO(85, 194, 196, 1),
            backgroundColor: const Color(0xFFAEC3B0),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
