import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osis/app/modules/vote/views/vote_view.dart';
import '../controllers/home_controller.dart';
import '../../candidates/views/candidates_view.dart';

class HomeView extends GetView<HomeController> {
  final int nis;
  const HomeView({required this.nis, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [
      Center(child: Text("Selamat datang di Beranda")),
      const CandidatesView(),
      const Vote1View(),
      Center(child: Text("Statistik")),
      Center(child: Text("Profil")),
    ];

    final navItems = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
      BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Kandidat'),
      BottomNavigationBarItem(icon: Icon(Icons.how_to_vote), label: 'Vote'),
      BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Statistik'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello, User"),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage("assets/icon/user.png"),
            radius: 18,
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: navItems,
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changePage,
            selectedItemColor: Colors.green[700],
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
          )),
    );
  }
}
