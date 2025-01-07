
import 'package:chat_application/components/constants.dart';
import 'package:chat_application/screens/login_screen.dart';
import 'package:chat_application/screens/register_sreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../components/rounder_button.dart';

class WelcomeScreen extends StatefulWidget {
  //TODO Initialize The Route
  static const String id="welcome_screen";

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;

//TODO Init State
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 1),
        //upperBound: 100,
        vsync: this);

    //TODO Tween Color
    animation= ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white
    ).animate(controller);

    //controller.reverse(from: 100);
    // Status is Dismised
    controller.forward();
    //TODO Status is Complete

    //TODO Curve Animation Implementation
    // animation=CurvedAnimation(parent: controller, curve: Curves.decelerate);
    // controller.forward();
    // controller.addListener(() {
    //   setState(() {
    //   });
    // });

//Controller With Listner
    // //TODO Loop in Forward And Reverse Status
    // controller.addStatusListener((status) {
    //   if(status==AnimationStatus.completed){
    //     controller.reverse(from: 100);
    //   }else if(status==AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    // });

//TODO Start Controlller Class
    controller.addListener(() {
      setState(() {
       // print(controller.value);
      });
    });
  }

  //TODO Calling Disposed Method
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: animation.value,

        //TODO Appbar
        appBar: AppBar(title: const Text('Welcome Screen',style: TextStyle(
          color: Colors.white,
        ),),
          backgroundColor: Colors.black,
        ),

        body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              //TODO Implementing First Row
               Row(
                children: [

                  //TODO Apllying Hero Annimation
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 40.0,
                     // width: 40.0,
                      child: Image.asset("images/flash.png"),
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0
                    ),

                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText('Fireside Chat'),
                      ],
                    )
                  )

                ],
              ),

              const SizedBox(
                height: 30.0,
              ),

              //TODO LOG In Button
              RoundedButton(
                tittle: 'Log In',
                onTap: (){
                  Navigator.pushNamed(context, LogInScreen.id);
                },
              ),

              const SizedBox(
                height: 30.0,
              ),

              //TODO Register Button
              RoundedButton(
                tittle: 'Register',
                onTap: (){
                  Navigator.pushNamed(context, RegisterScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}




