import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_firebase_login/Ui/LoginPage.dart';
import 'package:redux_firebase_login/Ui/WelcomeScreen.dart';
import 'package:redux_firebase_login/Ui/signup_page.dart';
import 'package:redux_firebase_login/Utils/Routes.dart';
import 'package:redux_firebase_login/redux/Appstate.dart';

class Application extends StatelessWidget {
  final Store<AppState> store;

  Application(this.store) : super();



  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child:
         MaterialApp(
          darkTheme: ThemeData(
            brightness: Brightness.light,
          ),
          navigatorKey: Keys.navKey,
          debugShowCheckedModeBanner: false,
          home: Login(),
          routes: <String, WidgetBuilder>{
            Routes.welcomeScreen: (context) {
              return Welcome();
            },
            Routes.signUpScreen: (context) {
              return SignUp();
            },
          },
        )
    );
  }
}
