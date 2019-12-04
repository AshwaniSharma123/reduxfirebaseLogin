import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_firebase_login/Application.dart';
import 'package:redux_firebase_login/redux/Appstate.dart';
import 'package:redux_firebase_login/redux/Middleware/Middleware.dart';
import 'package:redux_firebase_login/redux/Reducer/Reducer.dart';

void main() async {
  //add redux store provider function at app init
  final store = Store<AppState>(appReducer,
      initialState: AppState(
         
          loginLoader: false, loginModel: null,
        ), //initialize value if you want!!
      middleware: createAppMiddleware());

  runApp(StoreProvider(
      store: store, child: Application(store))); //run main function
}
