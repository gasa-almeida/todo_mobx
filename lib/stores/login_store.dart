import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {



  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool passwordVisible = false;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;


  @action
  void setEmail (String value) => email = value;

  @action
  setPassowrd (String value) => password = value;

  @action
  void tooglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  Future<void> login() async {
    loading = true;

    //executa codigo
    await Future.delayed(Duration(seconds: 3));

    loading = false;
    loggedIn = true;

  }

  
  @computed
  bool get isEmailValid =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  
  @computed
  bool get isPassowrdValid => password.length > 6;


  @computed
  Function get loginPressed => (isEmailValid && isPassowrdValid && !loading) ? login : null;

}


