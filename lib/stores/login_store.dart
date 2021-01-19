import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email = '';

  @action
  void setEmail(String valeu) => email = valeu;

  @observable
  String password = '';

  @action
  void setPassword(String valeu) => password = valeu;

  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisible() => passwordVisible = !passwordVisible;

  @observable
  bool loggedIn = false;

  @observable
  bool loading = false;

  @action
  Future<void> login() async {
    loading = true;

    // Processar
    await Future.delayed(Duration(seconds: 1));

    loading = false;
    loggedIn = true;

    email = '';
    password = '';
  }

  @action
  void logout() {
    loggedIn = false;
  }

  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  // @computed
  // bool get isFormValid => isEmailValid && isPasswordValid;

  @computed
  Function get loginPressed =>
      (isEmailValid && isPasswordValid && !loading) ? login : null;
}
