import 'package:get/get.dart';
import '../controllers/vote_controller.dart';

class Vote1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Vote1Controller>(() => Vote1Controller());
  }
}
