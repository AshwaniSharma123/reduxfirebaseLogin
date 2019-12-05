
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redux/redux.dart';
import 'package:redux_firebase_login/Utils/Routes.dart';
import 'package:redux_firebase_login/models/LoginModel.dart';
import 'package:redux_firebase_login/redux/Actions/LoginActions.dart';
import 'package:redux_firebase_login/redux/Appstate.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {

  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  Store<AppState> store;
  
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose(){
    
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _LoginModel>(
        converter: (Store<AppState> store) {
          this.store = store;
          return _LoginModel.create(store, context);
        },
        builder: (BuildContext context, _LoginModel reducerSetup) {
        
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'fire Auth',
      theme: ThemeData(
        primarySwatch: Colors.grey,
            ),
      home: Scaffold(
              appBar: AppBar(
                title: Text('Redux login'),
              ),
              body: SingleChildScrollView(
                child: Container(
                  child:
                 Column(
                    children: <Widget>[
                      SizedBox(height: 40,),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child:
                        TextFormField(
                          controller: _emailController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            //   hintText: 'User Name',
                            labelText: "user",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                           controller: _passwordController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            labelText: "password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0,),
                     reducerSetup.isLoader ? Center(child:CircularProgressIndicator()):
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RaisedButton(
                              elevation: 5.0,
                              child: Text('Sign in',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                              splashColor: Colors.pinkAccent,
                              onPressed: () {
          
                     LoginModel _model =  LoginModel(_emailController.text.toString(),
                           _passwordController.text.toString());
                          store.dispatch(LoginSignInAction(_model));
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));   
                              }
                          ),
                          SizedBox(height: 40),
                          RaisedButton(
                              elevation: 5.0,
                              child: Text('Register Now',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),),
                              splashColor: Colors.green,
                              onPressed: () {
                //  SignUpModel _model =  SignUpModel(_emailController.text.toString(), _passwordController.text.toString());
                // store.dispatch(SignUpAction(_model));
                Keys.navKey.currentState.pushNamed(Routes.signUpScreen,);
                               // registerUser();
                              }
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
           );
         }
       );
      }
  //void registerUser() async {
  //   final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
  //     email: _emailController.text.toString(),
  //     password: _passwordController.text.toString(),
  //   )).user;
  // }
}

class _LoginModel {

  final bool isLoader;
  final Store<AppState> store;
  _LoginModel(this.isLoader, this.store);

  factory _LoginModel.create(Store<AppState> store, BuildContext context) {
    return _LoginModel(
        store.state.loginLoader, store);
  }
}

