import 'package:flutter/material.dart';
import 'vote_page2.dart';

class VotePage extends StatefulWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  final TextEditingController _namaController = TextEditingController();
  String? selectedKelas;
  String? selectedProfesi;

  final List<String> kelasList = [
    'VII A',
    'VII B',
    'VII C',
    'VII D',
    'VIII A',
    'VIII B',
    'VIII C',
    'VIII D',
    'IX A',
    'IX B',
    'IX C',
    'IX D',
  ];

  final List<String> profesiList = [
    'Ketua Kelas',
    'Wakil Ketua Kelas',
    'Sekretaris',
    'Bendahara',
    'Siswa',
  ];

  void navigateToVote2Page(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const CandidateVotePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 142, 13),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 142, 13),
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
        title: const Text(
          "Vote",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Peringatan!",
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Anda hanya dapat mengisi vote ini sekali, jadi pastikan anda menggunakan hak pilih anda dengan bijak.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 24),
            Image.asset('assets/icon/nu-10.png', width: 120),
            const SizedBox(height: 24),

            // Input Nama Lengkap
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: "Nama Lengkap",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Dropdown Kelas
            DropdownButtonFormField<String>(
              value: selectedKelas,
              items: kelasList.map((kelas) {
                return DropdownMenuItem(
                  value: kelas,
                  child: Text(kelas),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: "Kelas",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  selectedKelas = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Dropdown Profesi
            DropdownButtonFormField<String>(
              value: selectedProfesi,
              items: profesiList.map((profesi) {
                return DropdownMenuItem(
                  value: profesi,
                  child: Text(profesi),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: "Profesi",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  selectedProfesi = value;
                });
              },
            ),
            const SizedBox(height: 24),

            // Tombol Lanjut
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_namaController.text.isNotEmpty && selectedKelas != null && selectedProfesi != null) {
                    navigateToVote2Page(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Lengkapi semua data sebelum lanjut."),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[900],
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  "Lanjut", 
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
