import 'dart:async';
import 'package:flutter/material.dart';
import 'vote_page.dart';
import 'statistik_page.dart';
import 'profil_page.dart';

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
    const CandidatesPage(),
    const VotePage(),
    const StatistikPage(),
    const ProfilPage()
  ];

  void _navigateToVotePage() {
    setState(() {
      _isInVotePage = true;
    });

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const VotePage(),
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
    ).then((_) {
      setState(() {
        _isInVotePage = false;
      });
    });
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      _navigateToVotePage();
    } else {
      setState(() {
        _selectedIndex = index;
      });
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
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: const [
                Text("Hello, User", style: TextStyle(color: Colors.green, fontSize: 16)),
                SizedBox(width: 12),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/icon/user.png"),
                  radius: 18,
                ),
              ],
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildCustomBottomNavigationBar(),
      extendBody: true, // Keep this to allow content to flow under the navigation bar
    );
  }

  Widget _buildCustomBottomNavigationBar() {
    final Color primaryGreen = const Color(0xFF006633);
    final Color backgroundColor = Colors.white;

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
              onTap: () => _navigateToVotePage(),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: primaryGreen,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    'assets/icon/voting.png',
                    width: 30,
                    color: Colors.white,
                  ),
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
    final Color primaryGreen = const Color(0xFF006633);
    
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

        if (title == 'Vote') {
          _navigateToVotePage();
        } else {
          int index = 0;
          switch (title) {
            case 'Beranda':
              index = 0;
              break;
            case 'Kandidat':
              index = 1;
              break;
            case 'Statistik':
              index = 3;
              break;
            case 'Profil':
              index = 4;
              break;
          }
          _onItemTapped(index);
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
        padding: EdgeInsets.fromLTRB(
          16, 
          16, 
          16,
          // Add bottom padding to prevent content from being hidden behind the navbar
          MediaQuery.of(context).padding.bottom + 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const VotePage(),
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
            const Text(
              "The Candidates",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: candidates.length,
                itemBuilder: (context, index) {
                  final c = candidates[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CandidateCard(
                      name: c['name']!,
                      image: c['image']!,
                      visi: c['visi']!,
                      misi: c['misi']!,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Countdown",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
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
            )
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

// =================== Kandidat =====================

class CandidatesPage extends StatelessWidget {
  const CandidatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5FDF9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              "The Candidates",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(
                left: 16, 
                right: 16,
                // Add bottom padding to prevent content from being hidden behind the navbar
                bottom: MediaQuery.of(context).padding.bottom + 100,
              ),
              itemCount: candidates.length,
              itemBuilder: (context, index) {
                final c = candidates[index];
                return CandidateCard(
                  name: c['name']!,
                  image: c['image']!,
                  visi: c['visi']!,
                  misi: c['misi']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

const List<Map<String, String>> candidates = [
  {
    'name': 'Moch. Lukman',
    'image': 'assets/icon/lukman.png',
    'visi': 'Lorem ipsum dolor sit amet',
    'misi': 'Curabitur condimentum molestie posuere',
  },
  {
    'name': 'Aurelia Naura',
    'image': 'assets/icon/naura.png',
    'visi': 'Lorem ipsum dolor sit amet',
    'misi': 'Curabitur condimentum molestie posuere',
  },
  {
    'name': 'Andra Gio F.',
    'image': 'assets/icon/andra.png',
    'visi': 'Lorem ipsum dolor sit amet',
    'misi': 'Curabitur condimentum molestie posuere',
  },
];

class CandidateCard extends StatelessWidget {
  final String name;
  final String image;
  final String visi;
  final String misi;

  const CandidateCard({
    required this.name,
    required this.image,
    required this.visi,
    required this.misi,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE3A963),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image, width: 64, height: 64, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                const Text('Visi', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(visi),
                const SizedBox(height: 4),
                const Text('Misi', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(misi),
              ],
            ),
          )
        ],
      ),
    );
  }
}
