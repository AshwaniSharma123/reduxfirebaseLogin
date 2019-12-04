import 'package:flutter/cupertino.dart';
import 'package:redux_firebase_login/models/LoginModel.dart';


@immutable

class AppState {
  final LoginModel loginModel;
  final bool loginLoader; 


const AppState({
    @required this.loginModel,
    @required this.loginLoader
});
}