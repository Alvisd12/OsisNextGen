import 'package:get/get.dart';

import '../controllers/vote_service_controller.dart';

class VoteServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoteServiceController>(
      () => VoteServiceController(),
    );
  }
}
