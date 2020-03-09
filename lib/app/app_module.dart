import 'package:hello_word/app/modules/auth/auth/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:hello_word/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:hello_word/app/app_widget.dart';
import 'package:hello_word/app/modules/auth/welcome/welcome_page.dart';
import 'package:hello_word/app/modules/graphgl/index/index_module.dart';
import 'package:hello_word/app/modules/home/home_module.dart';
import 'package:hello_word/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:hello_word/app/shared/repositories/localstorage/local_storage_share.dart';
import 'package:hello_word/app/shared/services/shared_preferences_service.dart';
import 'package:hello_word/app/shared/utils/constants.dart';

import 'modules/auth/auth/repositories/auth_repository.dart';
import 'modules/auth/auth/repositories/auth_repository_interface.dart';
import 'modules/auth/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<ILocalStorage>((i) => LocalStorageShared()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => SharedPreferenceService()),
        Bind((i) => AuthController()),
        Bind((i) => Dio(BaseOptions(baseUrl: BASE_URL))),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => WelcomePage(), transition: TransitionType.noTransition),
        Router('/auth', module: LoginModule()),
        Router('/home', module: HomeModule()),
        Router('/index', module: IndexModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
