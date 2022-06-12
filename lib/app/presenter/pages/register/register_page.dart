import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/shared/image_path.dart';
import './register_controller.dart';
import 'widget/field_widget.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Cadastro',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: SizedBox(
                  height: 100,
                  width: 200,
                  child: Image.asset(
                    ImagePath.getLogo(),
                    fit: BoxFit.contain,
                  )),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  FieldWidget(
                    label: 'Email',
                    icon: Icons.email,
                    controller: controller.emailControll,
                  ),
                  const SizedBox(height: 15),
                  FieldWidget(
                    label: 'Name',
                    icon: Icons.person,
                    controller: controller.nameControll,
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    thickness: 0.2,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  FieldWidget(
                    label: 'CEP',
                    icon: Icons.location_on,
                    onChanged: controller.getAddress,
                    controller: controller.cepControll,
                  ),
                  const SizedBox(height: 20),
                  FieldWidget(
                    controller: controller.resultCepControll,
                    label: '',
                    icon: Icons.near_me,
                    enablaed: false,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 250,
                    height: 40,
                    child: Obx(() => OutlinedButton(
                          onPressed: controller.canRegistre.value
                              ? controller.registerCompleted
                              : null,
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            )
          ]),
        ));
  }
}
