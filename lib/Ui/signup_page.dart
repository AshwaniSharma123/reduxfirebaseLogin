
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:redux_firebase_login/Ui/WelcomeScreen.dart';
import 'package:redux_firebase_login/Utils/Routes.dart';
import 'package:redux_firebase_login/models/LoginModel.dart';
import 'package:redux_firebase_login/models/signup_models.dart';
import 'package:redux_firebase_login/redux/Actions/LoginActions.dart';
import 'package:redux_firebase_login/redux/Actions/signup_actions.dart';
import 'package:redux_firebase_login/redux/Appstate.dart';
import 'package:toast/toast.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {

  
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  Store<AppState> store;
  
  
  

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _SignUpModel>(
        converter: (Store<AppState> store) {
          this.store = store;
          return _SignUpModel.create(store, context);
        },
        builder: (BuildContext context, _SignUpModel reducerSetup) {
        
    return Scaffold(
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
                            labelText: "create email ",
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
                            labelText: "create password",
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
                              child: Text('Submit',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),),
                              splashColor: Colors.green,
                              onPressed: () {

                 SignUpModel _model =  SignUpModel(_emailController.text.toString(), _passwordController.text.toString());
                store.dispatch(SignUpAction(_model));
                //Keys.navKey.currentState.pushNamed(Routes.welcomeScreen,);
                               // registerUser();
                              }
                          ),
                        ],
                      ),
                    ],
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

class _SignUpModel {
  final bool isLoader;
  final Store<AppState> store;
  _SignUpModel(this.isLoader, this.store);

  factory _SignUpModel.create(Store<AppState> store, BuildContext context) {
    return _SignUpModel(
        store.state.signUploader, store);
  }
}

