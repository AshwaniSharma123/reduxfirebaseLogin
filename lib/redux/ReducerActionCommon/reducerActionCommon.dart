
import 'package:redux/redux.dart';
import 'package:redux_firebase_login/models/LoginModel.dart';
import 'package:redux_firebase_login/models/signup_models.dart';
import 'package:redux_firebase_login/redux/Actions/LoginActions.dart';
import 'package:redux_firebase_login/redux/Actions/signup_actions.dart';

final loginReducer = TypedReducer<LoginModel, LoginSignInAction>(_loginActionReducer);
final loginLoaderReducer = TypedReducer<bool, LoginLoaderAction>(_loginLoaderActionReducer);
final signUpReducer = TypedReducer<SignUpModel, SignUpAction>(_signUpReducer);
final signUpLoaderReducer = TypedReducer<bool , SignUpLoaderAction>(_signUpLoaderActionReducer);

//login Reducer
LoginModel _loginActionReducer(LoginModel state, LoginSignInAction action) {
  return action.loginModel;
}


//loader
bool _loginLoaderActionReducer(bool state, LoginLoaderAction action) {
  return action.loginLoader;
}

//Signup Reducer
SignUpModel _signUpReducer(SignUpModel state, SignUpAction action) { 
  return action.signUpModel;
}

bool _signUpLoaderActionReducer(bool state, SignUpLoaderAction action){
  return action.signupLoader;
}