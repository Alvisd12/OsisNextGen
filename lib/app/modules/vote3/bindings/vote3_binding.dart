import 'package:get/get.dart';
import 'package:osis/app/modules/vote3/controllers/vote3_controller.dart';


class Vote3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Vote3Controller>(() => Vote3Controller());
  }
}
