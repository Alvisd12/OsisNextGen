import 'package:flutter/material.dart';
import 'vote_page2.dart';

class VotePage extends StatefulWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedKelas;
  String? selectedProfesi;
  final TextEditingController namaController = TextEditingController();

  final List<String> kelasList = ['7A', '7B', '8A', '8B', '9A', '9B'];
  final List<String> profesiList = ['Siswa', 'Guru', 'Staf', 'Lainnya'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00A651), // Warna hijau sesuai gambar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CircleAvatar(
            backgroundColor: Colors.orange,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
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
              Image.asset(
                'assets/icon/nu-10.png', // Ganti dengan path yang sesuai
                height: 120,
              ),
              const SizedBox(height: 24),

              // Input Nama Lengkap
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nama Lengkap",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Nama Lengkap',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 20),

              // Dropdown Kelas
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Kelas",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: selectedKelas,
                items: kelasList
                    .map((kelas) => DropdownMenuItem(value: kelas, child: Text(kelas)))
                    .toList(),
                onChanged: (value) => setState(() => selectedKelas = value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Pilih Jawaban Anda',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 20),

              // Dropdown Profesi
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Profesi",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: selectedProfesi,
                items: profesiList
                    .map((profesi) => DropdownMenuItem(value: profesi, child: Text(profesi)))
                    .toList(),
                onChanged: (value) => setState(() => selectedProfesi = value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Pilih Jawaban Anda',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 30),

              // Tombol Lanjut
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[900],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                          pageBuilder: (_, __, ___) => const CandidateVotePage(),
                          transitionsBuilder: (_, animation, __, child) {
                          final offset = Tween<Offset>(
                            begin: const Offset(0, 1),
                            end: Offset.zero,
                          ).animate(animation);
                        return SlideTransition(position: offset, child: child);
        },
      ),
    );
  }
},

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
