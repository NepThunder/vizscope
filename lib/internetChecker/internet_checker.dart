import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GlobalInternetChecker extends StatefulWidget {
  final Widget child;

  const GlobalInternetChecker({required this.child, super.key});

  @override
  State<GlobalInternetChecker> createState() => _GlobalInternetCheckerState();
}

class _GlobalInternetCheckerState extends State<GlobalInternetChecker> {
  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    try {
      final response = await http.get(Uri.parse('https://www.google.com'));
      if (response.statusCode == 200) {
      } else {
        _showNoNetworkDialog();
      }
    } catch (error) {
      _showNoNetworkDialog();
    }
  }

  void _showNoNetworkDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('No Internet Connection'),
          content: const Text(
              'Please check your internet connection and try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _checkInternetConnection();
              },
              child: const Text('Retry'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
