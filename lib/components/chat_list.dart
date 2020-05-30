import 'package:flutter/material.dart';
import 'package:rookiehacks/classes/user.dart';
import 'package:rookiehacks/components/chat_item.dart';

import 'data_storage.dart';

class ChatList extends StatelessWidget {
  final ScrollController listScrollController = new ScrollController();
  static List<String> _messages = [];


  @override
  Widget build(BuildContext context) {
    final dataContainer = UserDataContainer.of(context);
    _messages = dataContainer.messages;

    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemBuilder: (context, index) {
        if (index < _messages.length) {
          return ChatItem(message: _messages[index]);
        }
        return null;
      },
      reverse: false,
      controller: listScrollController,
    );
  }
}
