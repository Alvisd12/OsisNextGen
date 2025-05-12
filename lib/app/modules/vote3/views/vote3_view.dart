import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/vote3_controller.dart';

class Vote3View extends GetView<Vote3Controller> {
  final Map<String, String> selectedCandidate;

  const Vote3View({Key? key, required this.selectedCandidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text(
                "Terima Kasih!",
                style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Anda hanya dapat mengisi vote ini sekali, jadi pastikan\nanda menggunakan hak pilih anda dengan bijak.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 14),
              ),
              const SizedBox(height: 32),
              const Icon(Icons.check_circle, color: Colors.green, size: 100),
              const SizedBox(height: 32),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pilihan Anda",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFA726),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(selectedCandidate['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedCandidate['id']!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          selectedCandidate['name']!,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(selectedCandidate['kelas']!),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Get.offAllNamed('/home'); // Ganti dengan route beranda yang sesuai
                  },
                  child: const Text("Kembali Ke Beranda"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
