import 'package:redux_firebase_login/models/signup_models.dart';

//api >> signup api action
class SignUpAction {
  final SignUpModel signUpModel;

  SignUpAction(this.signUpModel);
}


//api>> reflect in ui
class SignUpLoaderAction {

  final bool signupLoader;
 
  SignUpLoaderAction(this.signupLoader,);
}

