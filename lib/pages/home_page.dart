import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rookiehacks/classes/user.dart';
import 'package:rookiehacks/components/camera.dart';
import 'package:rookiehacks/components/data_storage.dart';
import 'package:rookiehacks/pages/grocery_list_page.dart';

import '../constants.dart';

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

  void _navigateToCamera() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Camera(),
      ),
    );
  }

  void _navigateToGroceryList() {
    Navigator.pushNamed(context, GroceryListPage.id);
  }

  @override
  Widget build(BuildContext context) {
    final dataContainer = UserDataContainer.of(context);
    dataContainer.listUsers = _listUsers;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          leading: Icon(
            Icons.shopping_cart,
            color: Colors.black,
            size: 30,
          ),
          title: Text(
            'Gateway',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w800,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Text(
                'Hi Terry, what would you like to do?',
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            GestureDetector(
              onTap: _navigateToGroceryList,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 176,
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: kGreenColor,
                      size: 80,
                    ),
                    Text(
                      'Type your grocery list',
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kGreenColor),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: _navigateToCamera,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: kGreenColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 176,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 80,
                    ),
                    Text(
                      'Upload your photo of your list',
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
