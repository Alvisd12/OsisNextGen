import 'package:get/get.dart';

class Vote2Controller extends GetxController {
  var selectedCandidate = RxnInt();

  final candidates = [
    {
      'id': '1',
      'name': 'Moch. Lukman',
      'kelas': 'VII D',
      'image': 'assets/icon/lukman.png'
    },
    {
      'id': '2',
      'name': 'Aurelia Naura',
      'kelas': 'VIII B',
      'image': 'assets/icon/naura.png'
    },
    {
      'id': '3',
      'name': 'Andra Gio F.',
      'kelas': 'VII D',
      'image': 'assets/icon/andra.png'
    },
  ];
}
