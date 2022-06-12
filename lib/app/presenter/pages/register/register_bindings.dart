import 'package:desafio_bemol/app/infra/contracts/repositories/search_cep_repository_impl.dart';
import 'package:desafio_bemol/app/infra/data/remote/datasource_via_cep_impl.dart';
import 'package:get/get.dart';
import '../../../domain/contracts/gateways/http_service.dart';
import '../../../domain/contracts/repositories/search_cep_repository.dart';
import '../../../domain/usecase/seach_cep_usecase.dart';
import '../../../infra/contracts/gateways/get_connect_service.dart';
import '../../../infra/data/remote/datasource_via_cep.dart';
import './register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HttpService>(() => GetConnectService());
    Get.lazyPut<DatasourceViaCep>(() => DatasourceViaCepImpl(Get.find()));
    Get.lazyPut<SearchCepRepository>(() => SearchCepRepositoryImpl(Get.find()));
    Get.lazyPut<SeachCepUsecase>(() => SeachCepUsecase(repository: Get.find()));
    Get.put(RegisterController(seachCepUsecase: Get.find()));
  }
}
