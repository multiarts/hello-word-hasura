import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_word/app/modules/auth/auth/repositories/auth_repository_interface.dart';
import 'package:hello_word/app/shared/services/shared_preferences_service.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthBase with _$AuthController;

abstract class _AuthBase with Store {

final IAuthRepository _authRepository = Modular.get();
final FormErrorState error = FormErrorState();

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  FirebaseUser user;

  @action
  setUser(FirebaseUser value) {
    user = value;
    status = user == null ? AuthStatus.logoff : AuthStatus.login;
  }

  _AuthBase() {
    _authRepository.getUser().then(setUser).catchError((e) {
      print('ERRORRRRRR');
    });
  }

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

  @action
  Future loginWithGoogle() async {
    user = await _authRepository.getGoogleLogin();
    final idToken = await user.getIdToken();
    print('Bearer ${idToken.token}');
    bool value = await sharedPreferenceService.getSharedPreferencesInstance();
    if (value == true) {
      sharedPreferenceService.setToken('Bearer ${idToken.token}');
    }
  }

  Future<String> token() async {
    final user = await FirebaseAuth.instance.currentUser();
    final idToken = await user.getIdToken();
    return 'Bearer ${idToken.token}';
  }

  Future logout() {
    return _authRepository.getLogout();
  }
}

enum AuthStatus { loading, login, logoff }

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String username;

  @observable
  String email;

  @observable
  String password;

  @computed
  bool get hasErrors => username != null || email != null || password != null;
}