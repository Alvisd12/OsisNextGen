// ... (import lainnya)
import 'dart:async';
import 'package:flutter/material.dart';
import 'vote_page.dart';
import 'statistik_page.dart';
import 'profil_page.dart';
import 'candidates_page.dart';
import 'candidate_data.dart';

class HomePage extends StatefulWidget {
  final int nis;
  const HomePage({required this.nis, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // ignore: unused_field
  bool _isInVotePage = false;

  final List<Widget> _pages = [
    const BerandaPage(),
    CandidatesPage(),
    const VotePage(),
    const StatistikPage(),
    const ProfilPage(),
  ];

  void _navigateToVotePage() {
    setState(() => _isInVotePage = true);

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, animation, __) => const VotePage(),
        transitionsBuilder: (_, animation, __, child) {
          final tween = Tween(begin: const Offset(0, 1), end: Offset.zero)
              .chain(CurveTween(curve: Curves.easeInOut));
          return SlideTransition(position: animation.drive(tween), child: child);
        },
      ),
    ).then((_) => setState(() => _isInVotePage = false));
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      _navigateToVotePage();
    } else {
      setState(() => _selectedIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.green[800],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: const [
                  Icon(Icons.campaign, size: 40, color: Colors.white),
                  SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("OSIS :", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("Next Gen", style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  )
                ],
              ),
            ),
            drawerItem(Icons.home, 'Beranda'),
            drawerItem(Icons.groups, 'Kandidat'),
            drawerItem(Icons.how_to_vote, 'Vote'),
            drawerItem(Icons.bar_chart, 'Statistik'),
            drawerItem(Icons.person, 'Profil'),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Center(
                child: Column(
                  children: [
                    Text("Made By: AlvisDeWinRet", style: TextStyle(color: Colors.white70, fontSize: 12)),
                    Text("Designed With: Figma", style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.green),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/icon/user.png"),
              radius: 18,
            ),
          ),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: _buildCustomBottomNavigationBar(),
      extendBody: true,
    );
  }

  Widget _buildCustomBottomNavigationBar() {
    const Color primaryGreen = Color(0xFF006633);
    const Color backgroundColor = Colors.white;

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, "assets/icon/home.png", "Beranda"),
              _buildNavItem(1, "assets/icon/kandidat.png", "Kandidat"),
              SizedBox(width: MediaQuery.of(context).size.width * 0.2),
              _buildNavItem(3, "assets/icon/stat.png", "Statistik"),
              _buildNavItem(4, "assets/icon/profil.png", "Profil"),
            ],
          ),
          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: _navigateToVotePage,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: primaryGreen,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset('assets/icon/voting.png', width: 30, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    final bool isSelected = _selectedIndex == index;
    const Color primaryGreen = Color(0xFF006633);

    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 24,
            height: 24,
            color: isSelected ? primaryGreen : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? primaryGreen : Colors.grey,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context);
        switch (title) {
          case 'Vote':
            _navigateToVotePage();
            break;
          case 'Beranda':
            _onItemTapped(0);
            break;
          case 'Kandidat':
            _onItemTapped(1);
            break;
          case 'Statistik':
            _onItemTapped(3);
            break;
          case 'Profil':
            _onItemTapped(4);
            break;
        }
      },
    );
  }
}

// =================== Beranda =====================

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  late Timer _timer;
  late PageController _pageController;
  Duration remaining = DateTime(2025, 5, 29, 23, 59).difference(DateTime.now());

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => updateCountdown());
  }

  void updateCountdown() {
    final end = DateTime(2025, 5, 29, 23, 59);
    final now = DateTime.now();
    setState(() {
      remaining = end.difference(now);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = remaining.inDays;
    final hours = remaining.inHours % 24;
    final minutes = remaining.inMinutes % 60;
    final seconds = remaining.inSeconds % 60;

    return Container(
      color: const Color(0xFFF5FDF9),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, MediaQuery.of(context).padding.bottom + 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, animation, __) => const VotePage(),
                    transitionsBuilder: (_, animation, __, child) {
                      final tween = Tween(begin: const Offset(0, 1), end: Offset.zero)
                          .chain(CurveTween(curve: Curves.easeInOut));
                      return SlideTransition(position: animation.drive(tween), child: child);
                    },
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[800],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: const [
                    Expanded(
                      child: Text(
                        "Select Your Choice Now!",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text("Countdown", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[800],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text("Pemilihan Ketua OSIS", style: TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      countdownBox("$days", "Hari"),
                      countdownBox("$hours", "Jam"),
                      countdownBox("$minutes", "Menit"),
                      countdownBox("$seconds", "Detik"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text("Pada 29 Mei 2025 Pukul 23:59", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text("Para Kandidat", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: candidateData.length,
              itemBuilder: (context, index) {
                final candidate = candidateData[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3A963),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          candidate['image'] ?? '',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(candidate['name'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              candidate['visi'] ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget countdownBox(String value, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
