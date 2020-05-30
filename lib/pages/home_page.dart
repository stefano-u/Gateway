import 'package:flutter/material.dart';
import 'package:rookiehacks/classes/user.dart';
import 'package:rookiehacks/components/data_storage.dart';
import 'package:rookiehacks/components/user_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rookiehacks/pages/chat_page.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<User> _listUsers = [];

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  loadUsers() {
    _listUsers.add(
      User(
        name: "Michael Jackson",
        image: 'assets/pic1.png',
      ),
    );

    _listUsers.add(
      User(
        name: "Terry McGinnis",
        image: 'assets/pic2.png',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dataContainer = UserDataContainer.of(context);
    dataContainer.listUsers = _listUsers;

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Row(

          )
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Account'),
            ),
          ],
        ),
      ),
    );
  }
}

//ListView.builder(
//itemBuilder: (context, index) {
//if (index < _listUsers.length) {
//return UserCard(
//user: _listUsers[index],
//);
//}
//return null;
//},
//),