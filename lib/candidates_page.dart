import 'package:flutter/material.dart';

class CandidatesPage extends StatelessWidget {
  final List<Map<String, String>> candidates = [
    {
      'name': 'Moch. Lukman',
      'image': 'assets/images/lukman.jpg',
      'visi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'misi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis gravida purus. Curabitur condimentum molestie posuere. Nullam porttitor maximus orci et lobortis. Morbi eget est ac arcu ullamcorper blandit.',
    },
    {
      'name': 'Aurelia Naura',
      'image': 'assets/images/aurelia.jpg',
      'visi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'misi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis gravida purus. Curabitur condimentum molestie posuere. Nullam porttitor maximus orci et lobortis. Morbi eget est ac arcu ullamcorper blandit.',
    },
    {
      'name': 'Andra Gio F.',
      'image': 'assets/images/andra.jpg',
      'visi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'misi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis gravida purus. Curabitur condimentum molestie posuere. Nullam porttitor maximus orci et lobortis. Morbi eget est ac arcu ullamcorper blandit.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FDF9),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu, color: Colors.green),
                Row(
                  children: const [
                    Text('Hello, User!', style: TextStyle(color: Colors.green)),
                    SizedBox(width: 8),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/icon/user.png'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

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
                itemCount: candidates.length,
                itemBuilder: (context, index) {
                  final candidate = candidates[index];
                  return CandidateCard(candidate: candidate);
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

  const CandidateCard({Key? key, required this.candidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE3A963),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              candidate['image']!,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  candidate['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Visi',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(candidate['visi']!),
                const SizedBox(height: 4),
                const Text(
                  'Misi',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(candidate['misi']!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
