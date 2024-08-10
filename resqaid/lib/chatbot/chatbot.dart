import 'dart:developer';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class Chatbot extends StatefulWidget {
  static const String routeName = "/chatbot";
  // final Gemini chatbot;
  const Chatbot({
    // required this.chatbot,
    super.key,
  });

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  // @override
  // void initState(){
  //   super.initState();

  // }

  //Defining the chat parameters like user, and list of chat messages
  ChatUser user = ChatUser(
    id: "0",
    firstName: "User",
  );

  ChatUser gemini = ChatUser(
    id: "gemini-chatbot-101",
    firstName: "Gemini",
  );

  List<ChatMessage> messages = [];


  //For storing the refernece of Gemini
  final Gemini chatbot = Gemini.instance;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Chat with Gemini",
            style: TextStyle(
                // color: Colors.amber,
                ),
          ),
        ),
        body: _chatpage());
  }

  Widget _chatpage() {
    return DashChat(
      messageOptions: MessageOptions(),
      messages: messages,
      currentUser: user,
      onSend: _sendChat,
    );
  }

  void _sendChat(ChatMessage chatMessages) {
    setState(() {
      messages = [chatMessages, ...messages];
    });
    try {
      String userPrompt = chatMessages.text;
      chatbot.streamGenerateContent(userPrompt).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == gemini) {
          setState(() {
            lastMessage = messages.removeAt(0);
            String response = event.content?.parts?.fold(
                    "", (previous, current) => "$previous ${current.text}") ??
                "";
            // log(response);
            lastMessage!.text += response;
            messages = [lastMessage!, ...messages];
          });
        } else {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
            user: gemini,
            createdAt: DateTime.now(),
            text: response,
          );
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
