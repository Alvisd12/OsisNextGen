import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  // Obx digunakan untuk reaktif pada UI
  var selectedIndex = 0.obs;

  // PageController untuk PageView
  late PageController pageController;

  // Timer untuk countdown
  Timer? timer;

  // Waktu tersisa (pemilihan OSIS)
  Rx<Duration> remaining = Duration().obs;

  // Ganti halaman bawah (bottom nav)
  void changePage(int index) {
    selectedIndex.value = index;
    // Navigasi berdasarkan indeks halaman
    switch (index) {
      case 0:
        // Tetap di Home
        break;
      case 1:
        Get.toNamed(Routes.CANDIDATES);
        break;
      case 2:
        Get.toNamed(Routes.VOTE);
        break;
      case 3:
        Get.toNamed(Routes.LOGIN); // Misalnya untuk logout
        break;
      default:
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(viewportFraction: 0.85);
    _startCountdown();
  }

  void _startCountdown() {
    updateCountdown(); // update pertama
    timer = Timer.periodic(const Duration(seconds: 1), (_) => updateCountdown());
  }

  void updateCountdown() {
    final end = DateTime(2025, 5, 29, 23, 59);
    final now = DateTime.now();
    final diff = end.difference(now);
    remaining.value = diff.isNegative ? Duration.zero : diff;
  }

  @override
  void onClose() {
    timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
