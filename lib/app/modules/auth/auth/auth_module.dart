import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_word/app/modules/auth/auth/auth_controller.dart';
import 'package:hello_word/app/modules/auth/auth/auth_page.dart';
import 'package:hello_word/app/modules/auth/signUp/signUp_page.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => AuthController()),
  ];

  @override
  List<Router> get routers => [
    Router('/', child: (_, args) => AuthPage()),
    Router('/signup', child: (_, args) => SignUpPage()),
  ];

  static Inject get to => Inject<AuthModule>.of();
}
