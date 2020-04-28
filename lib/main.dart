import 'package:flutter/material.dart';
import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flashchat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      initialRoute: 'welcome_screen',
      routes:{
        'welcome_screen': (context)=> WelcomeScreen(),
        'chat_screen': (context)=> ChatScreen(),
        'login_screen': (context)=> LoginScreen(),
        'registration_screen': (context)=> RegistrationScreen(),
      },
    );
  }
}
