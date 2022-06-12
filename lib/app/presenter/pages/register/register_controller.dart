import 'package:desafio_bemol/app/core/mixin/message_mixin.dart';
import 'package:desafio_bemol/app/domain/usecase/seach_cep_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController with MessageMixin {
  final SeachCepUsecase _seachCepUsecase;
  final _message = Rxn<MessageModel>();
  final resultCepControll = TextEditingController();
  final cepControll = TextEditingController();
  final emailControll = TextEditingController();
  final nameControll = TextEditingController();
  final canRegistre = false.obs;

  RegisterController({required SeachCepUsecase seachCepUsecase})
      : _seachCepUsecase = seachCepUsecase;

  Future<void> getAddress(String cep) async {
    if (cep.length == 8) {
      var response = await _seachCepUsecase(cep);
      if (response.isLeft) {
        _message(MessageModel.error('Erro', response.left.toString()));
        canRegistre(false);
      } else {
        canRegistre.value = true;
        resultCepControll.text =
            '${response.right.street}, ${response.right.neighborhood}, ${response.right.city} ';
      }
    }
  }

  void registerCompleted() {
    if (validation()) {
      _message(
          MessageModel.sucess('Successo', 'Cadastro realizado com sucesso'));
      canRegistre(false);
      clean();
    }
  }

  bool validation() {
    if (emailControll.text.isEmpty) {
      _message(MessageModel.info('Alerta', 'Preencha o campo email'));
      return false;
    } else if (GetUtils.isEmail(emailControll.text) == false) {
      _message(MessageModel.info('Alerta', 'Email inválido'));
      return false;
    }
    if (nameControll.text.isEmpty) {
      _message(MessageModel.info('Alerta', 'Preencha o campo nome'));
      return false;
    }

    return true;
  }

  clean() {
    resultCepControll.clear();
    cepControll.clear();
    emailControll.clear();
    nameControll.clear();
  }

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }
}
