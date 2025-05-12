import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/vote_controller.dart';

class Vote1View extends GetView<Vote1Controller> {
  const Vote1View({Key? key}) : super(key: key);

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
        child: Form(
          key: controller.formKey,
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

              Align(
                alignment: Alignment.centerLeft,
                child: Text("Nama Lengkap", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.namaController,
                validator: (value) => value!.isEmpty ? 'Nama wajib diisi' : null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Nama Lengkap',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("Kelas", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              const SizedBox(height: 8),
              Obx(() => DropdownButtonFormField<String>(
                    value: controller.selectedKelas.value,
                    items: controller.kelasList
                        .map((kelas) => DropdownMenuItem(value: kelas, child: Text(kelas)))
                        .toList(),
                    onChanged: (value) => controller.selectedKelas.value = value!,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Pilih Jawaban Anda',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  )),
              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("Profesi", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              const SizedBox(height: 8),
              Obx(() => DropdownButtonFormField<String>(
                    value: controller.selectedProfesi.value,
                    items: controller.profesiList
                        .map((profesi) => DropdownMenuItem(value: profesi, child: Text(profesi)))
                        .toList(),
                    onChanged: (value) => controller.selectedProfesi.value = value!,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Pilih Jawaban Anda',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  )),
              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[900],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: controller.goToCandidateVote,
                  child: const Text("Lanjut"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
