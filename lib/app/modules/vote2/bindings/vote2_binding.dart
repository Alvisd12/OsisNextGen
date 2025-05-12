import 'package:get/get.dart';
import '../controllers/vote2_controller.dart';

class Vote2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Vote2Controller>(() => Vote2Controller());
  }
}
