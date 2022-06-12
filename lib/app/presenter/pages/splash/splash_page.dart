import 'package:desafio_bemol/app/core/shared/image_path.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(child: Image.asset(ImagePath.getLogo())),
          const SizedBox(
            height: 20,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
