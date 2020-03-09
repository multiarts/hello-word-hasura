import 'package:hello_word/app/modules/auth/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_word/app/modules/auth/login/login_page.dart';
import 'package:hello_word/app/modules/auth/signUp/signUp_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
        Router('/signup', child: (_, args) => SignUpPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
