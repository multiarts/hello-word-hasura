import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_word/app/modules/auth/auth/auth_controller.dart';
import 'package:hello_word/app/shared/services/shared_preferences_service.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController auth = Modular.get();
  SharedPreferenceService sharedPreferenceService = Modular.get();
  final FormErrorState error = FormErrorState();

  @observable
  bool loading = false;

  @action
  Future loginWithGoogle() async {
    try {
      loading = true;
      await auth.loginWithGoogle();
      Modular.to.pushReplacementNamed('/index');
    } catch (e) {
      loading = false;
    }
  }

  /// Login EmailAndPassword

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  ObservableFuture<bool> _usernameCheck = ObservableFuture.value(true);

  @computed
  bool get isUserCheckPending => _usernameCheck.status == FutureStatus.pending;

  @computed
  bool get canLogin => !error.hasErrors;

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => name, validateUsername),
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword)
    ];
  }

  @action
  // ignore: avoid_void_async
  Future validateUsername(String value) async {
    if (isNull(value) || value.isEmpty) {
      error.username = 'Cannot be blank';
      return;
    }

    try {
      _usernameCheck = ObservableFuture(checkValidUsername(value));

      error.username = null;

      final isValid = await _usernameCheck;
      if (!isValid) {
        error.username = 'Username cannot be "admin"';
        return;
      }
    } on Object catch (_) {
      error.username = null;
    }

    error.username = null;
  }

  @action
  void validatePassword(String value) {
    error.password = isNull(value) || value.isEmpty ? 'Cannot be blank' : null;
  }

  @action
  void validateEmail(String value) {
    error.email = isEmail(value) ? null : 'Not a valid email';
  }

  Future<bool> checkValidUsername(String value) async {
    await Future.delayed(const Duration(seconds: 1));

    return value != 'admin';
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateEmail(email);
    validateUsername(name);
    Modular.to.pushReplacementNamed('index');
  }
}

