
import 'package:redux_firebase_login/models/LoginModel.dart';

//when api is hit, how data is send to provider
class LoginSignInAction {
  final LoginModel loginModel;

  LoginSignInAction(this.loginModel);
}

//Login class -->> fetch data
class LoginLoaderAction {
  final bool loginLoader;
 

  LoginLoaderAction(this.loginLoader);
}


