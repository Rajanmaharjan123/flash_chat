import 'package:flashchat/Screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/Components/rounded_button.dart';
import 'package:flashchat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  String firstname;
  String lastname;
  String phonenumber;

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
                      image: AssetImage('images/ccc.jpg'), fit: BoxFit.cover),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Hero(
                            tag: 'logo',
                            child: Container(
                              padding: EdgeInsets.only(top: 50),
                              child: CircleAvatar(
                                radius: 30.0,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage('images/logo.png'),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              'Welcome',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 40,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFF).withOpacity(0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        child: Column(
                          children: <Widget>[
                            TextField(
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  firstname = value;
                                  //Do something with the user input.
                                },
                                decoration: kTextformfieldDecoration.copyWith(
                                    hintText: 'First Name')),
                            SizedBox(
                              height: 8.0,
                            ),
                            TextField(
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  lastname = value;

                                  //Do something with the user input.
                                },
                                decoration: kTextformfieldDecoration.copyWith(
                                    hintText: 'Last Name')),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextField(
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  email = value;
                                  //Do something with the user input.
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: kTextformfieldDecoration.copyWith(
                                    hintText: 'Enter your Email')),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextField(
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  phonenumber = value;
                                  //Do something with the user input.
                                },
                                keyboardType: TextInputType.phone,
                                decoration: kTextformfieldDecoration.copyWith(
                                    hintText: 'Phone Number')),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextField(
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  password = value;
                                  //Do something with the user input.
                                },
                                obscureText: true,
                                decoration: kTextformfieldDecoration.copyWith(
                                    hintText: 'Enter your Password')),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextField(
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  //Do something with the user input.
                                },
                                obscureText: true,
                                decoration: kTextformfieldDecoration.copyWith(
                                    hintText: 'Confirm Password')),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 100),
                        child: RoundedButton(
                          title: 'Register',
                          colour: Colors.blueAccent,
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              final newUser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              if (newUser != null){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => ChatScreen()));
                              }
                              setState(() {
                                showSpinner = false;
                              });
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
