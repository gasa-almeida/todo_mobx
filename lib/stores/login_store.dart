import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  _LoginStore(){
    autorun((_){
      print('validou: ' + isFormValid.toString());
    });
  }

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool passwordVisible = false;


  @action
  void setEmail (String value) => email = value;

  @action
  setPassowrd (String value) => password = value;

  @action
  void tooglePasswordVisibility() => passwordVisible = !passwordVisible;

  
  @computed
  bool get isEmailValid =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  
  @computed
  bool get isPassowrdValid => password.length > 6;

  @computed
  bool get isFormValid => isPassowrdValid && isEmailValid;

}


