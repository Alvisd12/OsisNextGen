import 'package:flutter/material.dart';
import 'vote_page3.dart';

class CandidateVotePage extends StatefulWidget {
  const CandidateVotePage({Key? key}) : super(key: key);

  @override
  State<CandidateVotePage> createState() => _CandidateVotePageState();
}

class _CandidateVotePageState extends State<CandidateVotePage> {
  int? selectedCandidate;

  final List<Map<String, String>> candidates = [
    {
      'id': '1',
      'name': 'Moch. Lukman',
      'kelas': 'VII D',
      'image': 'assets/icon/lukman.png'
    },
    {
      'id': '2',
      'name': 'Aurelia Naura',
      'kelas': 'VIII B',
      'image': 'assets/icon/naura.png'
    },
    {
      'id': '3',
      'name': 'Andra Gio F.',
      'kelas': 'VII D',
      'image': 'assets/icon/andra.png'
    },
  ];

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
              onPressed: () => Navigator.pop(context),
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
            Image.asset(
              'assets/icon/nu-10.png', // Sesuaikan path
              height: 120,
            ),
            const SizedBox(height: 24),
            ...candidates.map((candidate) {
              final id = int.parse(candidate['id']!);
              final isSelected = selectedCandidate == id;
              return GestureDetector(
                onTap: () => setState(() => selectedCandidate = id),
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
                            Text(
                              candidate['id']!,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              candidate['name']!,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
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
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
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
                  if (selectedCandidate != null) {
                    final selected = candidates[selectedCandidate! - 1];
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder: (_, __, ___) => VoteSuccessPage(selectedCandidate: selected),
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
    );
  }
}
