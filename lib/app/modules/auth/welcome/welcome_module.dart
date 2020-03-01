import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_word/app/modules/auth/auth/auth_module.dart';
import 'package:hello_word/app/modules/auth/signUp/signUp_page.dart';
import 'package:hello_word/app/modules/auth/welcome/welcome_page.dart';

class WelcomeModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    Router('/', child: (_, args) => WelcomePage()),
    Router('/auth', module: AuthModule()),
    Router('/signup', child: (_, args) => SignUpPage()),
  ];

  static Inject get to => Inject<WelcomeModule>.of();
}
