import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  String message;

  ChatItem({this.message});

  @override
  Widget build(BuildContext context) {
    //This is the sent message. We'll later use data from firebase instead of index to determine the message is sent or received.
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: Text(
                  message,
                ),
                padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                width: 200.0,
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(8.0)),
                margin: EdgeInsets.only(right: 10.0),
              )
            ],
            mainAxisAlignment:
                MainAxisAlignment.end, // aligns the chatitem to right end
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
              ),
            ],
          )
        ],
      ),
      margin: EdgeInsets.only(bottom: 10.0),
    );
  }
}
