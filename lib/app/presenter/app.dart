import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Desafio Software Engineer',
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    );
  }
}
