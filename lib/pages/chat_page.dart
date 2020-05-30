import 'package:flutter/material.dart';
import 'package:rookiehacks/classes/user.dart';
import 'package:rookiehacks/components/chat_input.dart';
import 'package:rookiehacks/components/chat_list.dart';

class ChatPage extends StatefulWidget {
  static const String id = 'chat_page';
  final User user;

  ChatPage({this.user});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  void _hideKeyboard() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Broceries'),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            _hideKeyboard();
          },
          child: Column(
            children: <Widget>[
              Expanded(child: ChatList()),
              ChatInput(),
            ],
          ),
        ),
      ),
    );
  }
}
