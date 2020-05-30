import 'package:flutter/material.dart';
import 'package:googleapis/vision/v1.dart';
import 'package:rookiehacks/classes/grocery_item.dart';
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
  List<GroceryItem> groceryItems = [
    GroceryItem(
      name: 'Apple',
      description:
          'Red delicious. Picked recently. Other variations available.',
      imageUrl:
          'https://i5.walmartimages.ca/images/Enlarge/094/514/6000200094514.jpg',
      count: 0,
    ),
    GroceryItem(
      name: 'Gallon of Milk',
      description: 'Available in bags or in jugs. Best consumed by June 1st.',
      imageUrl:
          'https://www.dollargeneral.com/media/catalog/product/cache/0729a8e318a86bbdd225c6c8aa5967a3/1/5/15966601_main.jpg',
      count: 0,
    ),
    GroceryItem(
      name: 'Eggs',
      description: 'Sourdough, whole wheat, or rye. Best before June 1st.',
      imageUrl:
          'https://nationalpostcom.files.wordpress.com/2018/03/eggcarton_marsh1.jpg?quality=80&strip=all&w=780',
      count: 0,
    ),
    GroceryItem(
      name: 'Bread',
      description:
          'Available in half-dozen, dozen, or 1½ dozen. Best before June 1st.',
      imageUrl:
          'https://www.theflavorbender.com/wp-content/uploads/2019/02/Homemade-Bread-Featured-1.jpg',
      count: 0,
    ),
  ];

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
