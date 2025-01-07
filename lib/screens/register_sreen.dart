import 'package:chat_application/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/rounder_button.dart';
import '../components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  static const String id="register_screen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //TODO Declire The Firebase Auth
  final _auth=FirebaseAuth.instance;

  String email='';
  String password='';

  //Modal Progress Hud
  bool showSpinner=false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //TODO APP bar
        appBar: AppBar(
          leading: GestureDetector(
            onTap:() {
              Navigator.pop(context);
            },
              child: Icon(Icons.arrow_back)),
          title: Text('Register Screen',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.teal,),
        backgroundColor: Colors.white,

          body: ModalProgressHUD(
            inAsyncCall: showSpinner,

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  //TODO Apllying Hero Animation
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 200.0,
                      width: 200.0,
                      child: Image.asset("images/flash.png"),
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),

                  //TODO Text Field For Email
                  TextField(
                      onChanged: (value){
                        //Do Something with the user input
                        email=value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: kInputDecoration.copyWith(
                          hintText: 'Enter Your Mail',
                          labelText: 'Enter Your Mail'
                      )
                  ),

                  SizedBox(
                    height: 20.0,
                  ),

                  TextField(
                    onChanged: (value){
                      //Do Something with the user input
                      password=value;
                    },
                    obscureText: true,
                    decoration: kInputDecoration.copyWith(
                        hintText: 'Enter Your Password',
                        labelText: 'Enter Your Password'
                    ),
                  ),

                  SizedBox(height: 20.0,),

                  //TODO Log In Button
                  RoundedButton(
                    tittle: 'Register',
                    onTap: () async{
                      //TODO Implementing Next
                      setState(() {
                        showSpinner=true;
                      });
                      //Try And Catch
                    try{
                      final newUser=await _auth.createUserWithEmailAndPassword(
                          email: email,
                          password: password);

                      if (newUser != null){
                        showSpinner=false;
                        Navigator.pushNamed(context, ChatScreen.id);
                      }

                    }catch(e){
                      print(e);
                    }

                    },

                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
