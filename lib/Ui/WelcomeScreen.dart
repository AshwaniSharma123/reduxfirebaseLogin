import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('redux-login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50,),
          TextFormField(
          decoration: InputDecoration(
            hintText: "Enter Name",
          ),
          // onSaved: (val){
          //   name = val;
          // },
          maxLength: 32,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Message",
          ),
          // onSaved: (val){
          //     message = val;
          // },
         // validator: validateMessage,
          maxLines: 5,
          maxLength: 256,
        ),
        SizedBox(height: 20,),
         Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
           RaisedButton(
             elevation: 10.0,
             splashColor: Colors.red,
              onPressed: (){},
             child:Text('Send') ,
           ),
           RaisedButton(
             elevation: 20.0,
             splashColor: Colors.green,
             onPressed: (){
              //  Toast.show("Data List", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => ShoData(id)));
             },
             child:Text('Show Data'),
           ),
         ],
       ),
      //  SizedBox(height: 80,),
          // Center(
          //   child: Text('Login Successful'),
          // ),
        ],
      ),
    );
  }
}