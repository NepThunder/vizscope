import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  RxBool isDialogShowing = false.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResults) {
    final connectivityResult = connectivityResults.first;

    if (connectivityResult == ConnectivityResult.none) {
      if (!isDialogShowing.value) {
        isDialogShowing.value = true;
        _showNoInternetDialog();
      }
    } else {
      if (isDialogShowing.value) {
        Get.back(); // Close the dialog if it's open
        isDialogShowing.value = false;
      }
    }
  }

  void _showNoInternetDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('No Internet Connection'),
        content: const Text(
          'Please check your internet connection and try again.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
              isDialogShowing.value = false;
              _checkInternetConnection();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  Future<void> _checkInternetConnection() async {
    final result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }
}
