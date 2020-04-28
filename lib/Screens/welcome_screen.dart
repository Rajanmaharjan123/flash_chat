import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flashchat/Screens/login_screen.dart';
import 'package:flashchat/Screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/Components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {



  @override


  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation animation;

  @override

  void initState(){
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds:2),
      vsync: this ,);
        animation = ColorTween(begin : Colors.blue, end: Colors.white).animate(controller) ;
        controller.forward();
        controller.addListener((){
      setState(() {});
    });
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/aaa.jpg'), fit: BoxFit.cover)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: <Widget>[Hero(
                        tag:'logo',
                        child: Container(
                           height: 60,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: animation.value,
                              backgroundImage: AssetImage('images/logo.png'),
                            )

                        ),
                      ),
                        SizedBox(
                          width: 5,
                        ),
                        TypewriterAnimatedTextKit(
                          text:['Flash Chat'],
                          textStyle: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RoundedButton(title: 'Log In',colour: Colors.lightBlueAccent, onPressed: (){ Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                    },),
                    RoundedButton(title: 'Register',colour: Colors.blueAccent,onPressed: (){ Navigator.of(context).push(
                        new MaterialPageRoute(builder: (context) => new RegistrationScreen()));
                    },)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


