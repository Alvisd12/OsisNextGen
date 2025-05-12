import 'package:get/get.dart';

import '../modules/beranda/bindings/beranda_binding.dart';
import '../modules/beranda/views/beranda_view.dart';
import '../modules/candidates/bindings/candidates_binding.dart';
import '../modules/candidates/views/candidates_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/vote/bindings/vote_binding.dart';
import '../modules/vote/views/vote_view.dart';
import '../modules/vote2/bindings/vote2_binding.dart';
import '../modules/vote2/views/vote2_view.dart';
import '../modules/vote3/bindings/vote3_binding.dart';
import '../modules/vote3/views/vote3_view.dart';
import '../modules/vote_service/bindings/vote_service_binding.dart';
import '../modules/vote_service/views/vote_service_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () {
        // Pastikan nanti diubah jika NIS dari Login ingin dikirim
        var nis = 0;
        return HomeView(nis: nis);
      },
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CANDIDATES,
      page: () => const CandidatesView(),
      binding: CandidatesBinding(),
    ),
    GetPage(
      name: _Paths.VOTE,
      page: () => const Vote1View(),
      binding: Vote1Binding(),
    ),
    GetPage(
      name: _Paths.VOTE2,
      page: () => const Vote2View(),
      binding: Vote2Binding(),
    ),
    GetPage(
      name: _Paths.VOTE3,
      page: () => Vote3View(selectedCandidate: {
        'id': '',
        'name': '',
        'kelas': '',
        'image': '',
      }), // Placeholder
      binding: Vote3Binding(),
    ),
    GetPage(
      name: _Paths.VOTE_SERVICE,
      page: () => const VoteServiceView(),
      binding: VoteServiceBinding(),
    ),
    GetPage(
      name: _Paths.BERANDA,
      page: () => const BerandaView(),
      binding: BerandaBinding(),
    ),
  ];
}
