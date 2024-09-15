import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProjectDetails extends StatefulWidget {
  final String projectName;

  const ProjectDetails({super.key, required this.projectName});

  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  Map<String, dynamic>? projectDetails;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProjectDetails();
  }

  Future<void> fetchProjectDetails() async {
    final url = 'https://example.com/api/project?name=${widget.projectName}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          projectDetails = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load project details')),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.projectName),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : projectDetails != null
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        projectDetails!['name'] ?? 'Unknown',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        projectDetails!['description'] ??
                            'No description available',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )
              : const Center(child: Text('No project details available')),
    );
  }
}
