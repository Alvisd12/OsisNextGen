import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osis/app/modules/vote2/controllers/vote2_controller.dart';
import '../../vote3/views/vote3_view.dart'; // Sesuaikan jika perlu

class Vote2View extends GetView<Vote2Controller> {
  const Vote2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00A651),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CircleAvatar(
            backgroundColor: Colors.orange,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Get.back(),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Peringatan!",
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Anda hanya dapat mengisi vote ini sekali, jadi pastikan\nanda menggunakan hak pilih anda dengan bijak.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 24),
            Image.asset('assets/icon/nu-10.png', height: 120),
            const SizedBox(height: 24),

            Obx(() => Column(
              children: controller.candidates.map((candidate) {
                final id = int.parse(candidate['id']!);
                final isSelected = controller.selectedCandidate.value == id;
                return GestureDetector(
                  onTap: () => controller.selectedCandidate.value = id,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFA726),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(12),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(candidate['image']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(candidate['id']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text(candidate['name']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(candidate['kelas']!),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Icon(
                            isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                            color: isSelected ? Colors.green : Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            )),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[900],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  if (controller.selectedCandidate.value != null) {
                    final selected = controller.candidates[controller.selectedCandidate.value! - 1];
                    Get.to(() => Vote3View(selectedCandidate: selected),
                      transition: Transition.downToUp,
                      duration: const Duration(milliseconds: 500),
                    );
                  }
                },
                child: const Text("Lanjut"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
