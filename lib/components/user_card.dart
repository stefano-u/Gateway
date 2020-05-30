import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rookiehacks/classes/user.dart';
import 'package:rookiehacks/pages/chat_page.dart';

class UserCard extends StatefulWidget {
  final User user;

  UserCard({this.user});

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {

  void _navigateToChatPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(
          user: widget.user,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 1,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListTile(
          leading: Image.asset(widget.user.image),
          title: Text(widget.user.name),
          onTap: _navigateToChatPage,
        ),
      ),
    );
  }
}

