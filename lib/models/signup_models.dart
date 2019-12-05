class SignUpModel {

  String _username;
  String _password;

  SignUpModel(this._username, this._password,);
 
  // ignore: unnecessary_getters_setters
  String get username => _username;
  // ignore: unnecessary_getters_setters
  set username(String value) {
    _username = value;
  }
   // ignore: unnecessary_getters_setters
  String get password => _password;
  // ignore: unnecessary_getters_setters
  set password(String value) {
    _password = value;
  }
}