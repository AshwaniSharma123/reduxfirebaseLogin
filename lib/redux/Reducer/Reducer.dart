import 'package:redux_firebase_login/redux/Appstate.dart';
import 'package:redux_firebase_login/redux/ReducerActionCommon/reducerActionCommon.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    loginModel: loginReducer(state.loginModel, action),
     loginLoader: loginLoaderReducer(state.loginLoader,action),
  );
}