import 'package:flutter/material.dart';
import 'candidate_data.dart';
import 'info_kandidat1.dart';
import 'info_kandidat2.dart';
import 'info_kandidat3.dart';

class CandidatesPage extends StatelessWidget {
  const CandidatesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FDF9),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul
            const Text(
              "The Candidates",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 12),

            // List Kandidat
            Expanded(
              child: ListView.builder(
                itemCount: candidateData.length,
                itemBuilder: (context, index) {
                  final candidate = candidateData[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman detail kandidat
                      Widget? targetPage;
                      switch (index) {
                        case 0:
                          targetPage = const InfoKandidat1();
                          break;
                        case 1:
                          targetPage = const InfoKandidat2();
                          break;
                        case 2:
                          targetPage = const InfoKandidat3();
                          break;
                      }
                      if (targetPage != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => targetPage!),
                        );
                      }
                    },
                    child: CandidateCard(candidate: candidate),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CandidateCard extends StatelessWidget {
  final Map<String, String> candidate;

  const CandidateCard({
    Key? key,
    required this.candidate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE3A963),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris Foto & Nama
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  candidate['image'] ?? '',
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  candidate['name'] ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          const Text(
            'Visi',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            candidate['visi'] ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 8),

          const Text(
            'Misi',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            candidate['misi'] ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
