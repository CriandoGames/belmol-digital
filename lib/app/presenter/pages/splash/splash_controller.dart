import 'package:desafio_bemol/app/presenter/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    //loadind simbolico para o splash
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.REGISTER);
    });
  }
}
