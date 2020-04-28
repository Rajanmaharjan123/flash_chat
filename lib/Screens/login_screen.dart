import 'package:flashchat/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flashchat/Screens/chat_screen.dart';
import 'package:flashchat/Components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  bool showSpinner =false;
  String email;
  String password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/bbb.jpg'), fit: BoxFit.cover),
                ),
                child: Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Hero(
                            tag: 'logo',
                            child: Container(
                              margin: EdgeInsets.only(top: 80),
                              child: CircleAvatar(
                                radius: 30.0,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage('images/logo.png'),
                              ),
                            ),
                          ),
                          Container(

                            margin: EdgeInsets.only(top: 20),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    'Welcome',
                                    style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 24.0,
                                ),
                                TextField(
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      email = value;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: kTextformfieldDecoration
                                        .copyWith(hintText: 'Enter your Email')

                                ),
                                SizedBox(
                                  height: 24.0,
                                ),
                                TextField(
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    obscureText: true,
                                    decoration: kTextformfieldDecoration
                                        .copyWith(
                                        hintText: 'Enter your Password')
                                ),
                                SizedBox(
                                  height: 24.0,
                                ),
                                RoundedButton(title: 'Log In',
                                  colour: Colors.lightBlueAccent,
                                  onPressed: () async{
                                  setState(() {
                                    showSpinner = true;
                                  });
                                  try{final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                                  if(user!=null){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => ChatScreen()));
                                  }
                                  setState(() {
                                    showSpinner = false;
                                  });
                                  }
                                  catch(e){
                                    print(e);
                                  }
                                  },),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        'Forgot password ? ',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    InkWell(
                                      child: Text("Click Here!",
                                        style: TextStyle(fontSize: 15,
                                            decoration: TextDecoration
                                                .underline),),
                                      onTap: () {
                                        print("click here");
                                      },
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




