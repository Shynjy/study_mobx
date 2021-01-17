import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    autorun(
      (_) {
        //Fica escutando toda alteração de um observable
        print(isFormValid);
      },
    );
  }

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

  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;
}
