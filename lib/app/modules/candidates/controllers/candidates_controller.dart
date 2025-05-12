import 'package:get/get.dart';

class CandidatesController extends GetxController {
  var candidates = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCandidates();
  }

  void loadCandidates() {
    candidates.value = [
      {
        'name': 'Moch. Lukman',
        'image': 'assets/images/lukman.png',
        'visi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'misi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis gravida purus. Curabitur condimentum molestie posuere. Nullam porttitor maximus orci et lobortis. Morbi eget est ac arcu ullamcorper blandit.',
      },
      {
        'name': 'Aurelia Naura',
        'image': 'assets/images/aurelia.png',
        'visi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'misi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis gravida purus. Curabitur condimentum molestie posuere. Nullam porttitor maximus orci et lobortis. Morbi eget est ac arcu ullamcorper blandit.',
      },
      {
        'name': 'Andra Gio F.',
        'image': 'assets/images/andra.png',
        'visi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'misi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis gravida purus. Curabitur condimentum molestie posuere. Nullam porttitor maximus orci et lobortis. Morbi eget est ac arcu ullamcorper blandit.',
      },
    ];
  }
}
