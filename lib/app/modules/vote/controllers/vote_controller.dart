import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osis/app/modules/vote2/views/vote2_view.dart'; // Ganti sesuai path yang benar

class Vote1Controller extends GetxController {
  final formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();

  final kelasList = ['7A', '7B', '8A', '8B', '9A', '9B'];
  final profesiList = ['Siswa', 'Guru', 'Staf', 'Lainnya'];

  var selectedKelas = RxnString();
  var selectedProfesi = RxnString();

  void goToCandidateVote() {
    if (formKey.currentState!.validate() &&
        namaController.text.trim().isNotEmpty &&
        selectedKelas.value != null &&
        selectedProfesi.value != null) {
      Get.to(
        () => const Vote2View(),
        transition: Transition.downToUp,
        duration: const Duration(milliseconds: 500),
      );
    } else {
      Get.snackbar(
        'Peringatan',
        'Semua kolom wajib diisi!',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    namaController.dispose();
    super.onClose();
  }
}
