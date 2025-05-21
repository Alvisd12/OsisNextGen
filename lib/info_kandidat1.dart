import 'package:flutter/material.dart';

class InfoKandidat1 extends StatelessWidget {
  const InfoKandidat1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FDF9),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE3A963),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    '1',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/icon/lukman.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Moch. Lukman',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Text('VII D', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 12),
                  const Text('Visi', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text('Misi', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis gravida purus. Curabitur condimentum molestie posuere. Nullam porttitor maximus orci et lobortis. Morbi eget est ac orci ullamcorper blandit.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
