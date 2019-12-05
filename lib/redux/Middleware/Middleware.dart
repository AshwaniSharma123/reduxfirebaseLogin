import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_firebase_login/Ui/LoginPage.dart';
import 'package:redux_firebase_login/Ui/WelcomeScreen.dart';
import 'package:redux_firebase_login/Utils/Routes.dart';
import 'package:redux_firebase_login/redux/Actions/LoginActions.dart';
import 'package:redux_firebase_login/redux/Actions/signup_actions.dart';
import 'package:redux_firebase_login/redux/Appstate.dart';
import 'package:redux_thunk/redux_thunk.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

List<Middleware<AppState>> createAppMiddleware() {
  return <Middleware<AppState>>[
    thunkMiddleware,
    TypedMiddleware<AppState, LoginSignInAction>(
        _signInAction),
    TypedMiddleware<AppState, SignUpAction>(
        _signUpAction),
  ];
}



 // <<<<<<<<<<<<<<<<<<<<<<<<<<<< Login FirebSe >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> // 

void _signInAction(Store<AppState> store, LoginSignInAction action,
    NextDispatcher next) async {
     store.dispatch(LoginLoaderAction(true));
  final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
                  email: action.loginModel.username,
                  password: action.loginModel.password)).user;
                   var user1 = _auth.currentUser();
                                  user1.then((data) {
                                    // print("$data");
           if (data.uid != null ) {                       
           Keys.navKey.currentState.pushNamed(Routes.welcomeScreen,);
                }
                else {
               store.dispatch(LoginLoaderAction(true));
                }
                 });
                }
    
// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< SignUp firebase >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> //

void _signUpAction(Store<AppState> store, SignUpAction action,
    NextDispatcher next) async {
       store.dispatch(SignUpLoaderAction(true));
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email:action.signUpModel.username,
      password: action.signUpModel.password,
    )).user;  
    }
