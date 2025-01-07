import 'package:chat_application/screens/chat_screen.dart';
import 'package:chat_application/screens/login_screen.dart';
import 'package:chat_application/screens/register_sreen.dart';
import 'package:chat_application/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


//TODO Initializing Firebase
late FirebaseApp app;
late FirebaseAuth auth;


void main() async{
  //TODO Initializing
  WidgetsFlutterBinding.ensureInitialized();
  app =await Firebase.initializeApp();
  auth=FirebaseAuth.instanceFor(app: app);

  runApp(FlashChat());
}
class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        )
      ),
      //TODO Set Initial Routes
      initialRoute: WelcomeScreen.id,

      //TODO Routing
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        LogInScreen.id : (context) => LogInScreen(),
        RegisterScreen.id : (context) => RegisterScreen(),
        ChatScreen.id : (context) => ChatScreen(),
      },
    );
  }
}



