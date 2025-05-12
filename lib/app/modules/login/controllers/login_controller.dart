import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osis/app/routes/app_pages.dart'; // Sesuaikan path jika perlu

class LoginController extends GetxController {
  final TextEditingController nisController = TextEditingController();

  void login() {
    final nisText = nisController.text.trim();

    if (nisText.isEmpty) {
      Get.snackbar(
        'Error',
        'NIS harus diisi!',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    final nis = int.tryParse(nisText);
    if (nis == null) {
      Get.snackbar(
        'Error',
        'NIS harus berupa angka!',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    Get.offAllNamed(Routes.HOME);
  }

  @override
  void onClose() {
    nisController.dispose();
    super.onClose();
  }
  
  void HomePage({required int nis}) {}
}
