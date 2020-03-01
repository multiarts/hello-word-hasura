import 'package:hello_word/app/modules/auth/auth/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:hello_word/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:hello_word/app/app_widget.dart';
// import 'package:hello_word/app/modules/auth/welcome/welcome_module.dart';
import 'package:hello_word/app/modules/graphgl/index/index_module.dart';
import 'package:hello_word/app/modules/home/home_module.dart';
import 'package:hello_word/app/shared/utils/constants.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthController()),
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: BASE_URL))),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: IndexModule()),
        // Router('/', module: WelcomeModule()),
        Router('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
