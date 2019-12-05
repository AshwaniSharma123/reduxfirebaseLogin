import 'package:flutter/cupertino.dart';
import 'package:redux_firebase_login/models/LoginModel.dart';
import 'package:redux_firebase_login/models/signup_models.dart';


@immutable

class AppState {
  final LoginModel loginModel;
  final bool loginLoader; 
  final SignUpModel signUpModel;
  final bool signUploader;


const AppState({
    @required this.loginModel,
    @required this.loginLoader,
    @required this.signUpModel,
    @required this.signUploader,
});
}