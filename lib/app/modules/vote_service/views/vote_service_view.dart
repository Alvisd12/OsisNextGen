import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vote_service_controller.dart';

class VoteServiceView extends GetView<VoteServiceController> {
  const VoteServiceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VoteServiceView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VoteServiceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
