import 'package:flutter/material.dart';
import 'package:rookiehacks/components/camera.dart';
import 'data_storage.dart';

class ChatInput extends StatefulWidget {
  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  UserDataContainerState _dataContainer;
  final TextEditingController textEditingController =
      new TextEditingController();

  void addMessage(String message) {
    _dataContainer.updateMessages(message);
    textEditingController.clear();
    _hideKeyboard();
  }

  // Event handler when the user taps outside of the login page
  void _hideKeyboard() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  void _navigateToCamera() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Camera(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _dataContainer = UserDataContainer.of(context);

    return Container(
      child: Row(
        children: <Widget>[
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              child: new IconButton(
                icon: new Icon(Icons.face),
              ),
            ),
            color: Colors.white,
          ),

          // Text input
          Flexible(
            child: Container(
              child: TextField(
                style: TextStyle(fontSize: 15.0),
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type a message',
                ),
              ),
            ),
          ),

          // Send Message Button
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () {
//                  addMessage(textEditingController.text);
                  _navigateToCamera();
                },
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(
          border: new Border(top: new BorderSide(width: 0.5)),
          color: Colors.white),
    );
  }
}
