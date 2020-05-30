import 'package:flutter/material.dart';
import 'package:googleapis/vision/v1.dart';
import 'package:rookiehacks/classes/user.dart';

class UserDataContainer extends StatefulWidget {
  final Widget child;

  UserDataContainer({this.child});

  static UserDataContainerState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserData>().data;
  }

  @override
  UserDataContainerState createState() => UserDataContainerState();
}

class UserDataContainerState extends State<UserDataContainer> {
  List<User> listUsers = [];
  List<String> messages = ['Hello there!'];
  WebLabel webLabel  = new WebLabel();

  void updateMessages(String newMessage) {
    setState(() {
      messages.add(newMessage);
    });
  }

  void updateWebLabel(WebLabel webLabel) {
    setState(() {
      messages.add(webLabel.toString());
//      this.webLabel = webLabel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UserData(
      child: widget.child,
      data: this,
    );
  }
}

class UserData extends InheritedWidget {
  final UserDataContainerState data;



  const UserData({
    Key key,
    this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(UserData old) {
    return true;
  }
}
