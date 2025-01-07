import 'package:chat_application/components/constants.dart';
import 'package:chat_application/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../components/rounder_button.dart';

class LogInScreen extends StatefulWidget {
  static const String id="login_screen";
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  final _auth=FirebaseAuth.instance;

  String email='';
  String password='';
  //Modal Progress hud
  bool showSpinner=false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
        //TODO APP bar
        appBar: AppBar(
          leading: GestureDetector(
              onTap:() {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          title: Text('Log In Screen',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.teal,),

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

                //TODO TextField For Password
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
                  tittle: 'Log In',
                  onTap: () async{
                    //TODO Implementing Next
                    setState(() {
                      showSpinner=true;
                    });

                    try{
                      final user= await _auth.signInWithEmailAndPassword(
                          email: email,
                          password: password);
                      if(user !=null){
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
