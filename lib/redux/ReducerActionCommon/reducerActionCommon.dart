
import 'package:redux/redux.dart';
import 'package:redux_firebase_login/models/LoginModel.dart';
import 'package:redux_firebase_login/redux/Actions/LoginActions.dart';

final loginReducer = TypedReducer<LoginModel, LoginSignInAction>(_loginActionReducer);
final loginLoaderReducer = TypedReducer<bool, LoginLoaderAction>(_loginLoaderActionReducer);

LoginModel _loginActionReducer(LoginModel state, LoginSignInAction action) {
  return action.loginModel;
}


bool _loginLoaderActionReducer(bool state, LoginLoaderAction action) {
  return action.loginLoader;
}