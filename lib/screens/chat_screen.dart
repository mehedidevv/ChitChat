import 'package:chat_application/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//TODO FireStore Instances
final _firestore = FirebaseFirestore.instance;
//TODO Initialize the Firebase Auth
final _auth = FirebaseAuth.instance;
late User loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = "chat_screen";

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  //After Send Message Then TextInput Box Will need Clear
  TextEditingController textEditingController = TextEditingController();
  String messageText = '';

  //TODO Loged In User
  void getCurrentUser() {
    try {
      //Applying Logic
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  //TODO Get All User Messages
  void getUserMessages() async {
    final messages = await _firestore.collection('message').get();
//TODO For In Loop
    for (var message in messages.docs) {
      print(message.data());
    }
  }

  //TODO Get Message Stream By Snapshort
  void getMessageStream() async {
    await for (var snapshort in _firestore.collection('message').snapshots()) {
      //TODO For In Loop
      for (var message in snapshort.docs) {
        print(message.data());
      }
    }
  }

  //TODO Initialize The State
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    // getUserMessages();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        //TODO APP Bar
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          actions: [
            IconButton(
              onPressed: () {
                getMessageStream();
                //Log Out
                // _auth.signOut();
                // Navigator.pop(context);
              },
              icon: Icon(Icons.close),
            ),
          ],
          title: Text(
            'Chat Screen',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.teal,
        ),

        //TODO Implemting Body
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //TODO StreamBuilder Will Implement Here
                MessageStreamBuilder(),
                //First Row
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        onChanged: (value) {
                          //On Click
                          messageText = value;
                        },
                        decoration: kButtonInputDecoration.copyWith(
                            hintText: 'Message',
                            labelText: 'Type Your Message Here'),
                      ),
                    ),

                    //TODO Send Button
                    TextButton(
                        onPressed: () {
                          textEditingController.clear();
                          //TODO Load Data To FireStore
                          _firestore.collection('message').add(
                              //Add Data By Map
                              {
                                //Key And Value
                                'text': messageText,
                                'sender': loggedInUser.email,
                              });
                        },
                        child: Text(
                          'Send',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Message Stream Builder
class MessageStreamBuilder extends StatelessWidget {

  const MessageStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      //Connect With Firestore Collection
        stream: _firestore.collection('message').snapshots(),

        //Built Method
        builder: (context, snapshort) {
          if (snapshort.hasData) {
            final messages = snapshort.data!.docs.reversed;

            List<MessageBubble> messageWidget = [];

            for (var message in messages) {
              final messageText = message['text'];
              final messageSender = message['sender'];

              //Check Current User is Sender Or Reciever
              final currentUser=loggedInUser.email;

              //Message Widget
              messageWidget.add(
                  MessageBubble(
                text: messageText,
                sender: messageSender,
                    isMyMessage: currentUser == messageSender,
              ));
            }

            //TODO Expanded And ListView Fro Scrolling
            return Expanded(
              child: ListView(
                reverse: true,
                children: messageWidget,
              ),
            );
          } else {
            return SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
        });
  }
}


//Messgage Bubble
class MessageBubble extends StatelessWidget {
  late final String text;
  late final String sender;
  final bool isMyMessage;

  MessageBubble({required this.text, required this.sender,this.isMyMessage=false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment: isMyMessage? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          //Sender Name
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Material(
              //If i am Sender Then Message Color Blue
              color: isMyMessage? Colors.blue : Colors.pink,
              borderRadius: isMyMessage? BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(0.0),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ):BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),),
              //Message Text
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
