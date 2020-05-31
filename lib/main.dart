import 'package:flutter/material.dart';
import 'package:rookiehacks/components/data_storage.dart';
import 'package:rookiehacks/pages/grocery_list_page.dart';
import 'package:rookiehacks/pages/home_page.dart';
import 'package:rookiehacks/pages/pickup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UserDataContainer(
      child: MaterialApp(
        title: 'Broceries',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomePage(),
        onGenerateRoute: generateRoute,
      ),
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.id:
        return MaterialPageRoute(builder: (_) => HomePage());
      case GroceryListPage.id:
        return MaterialPageRoute(builder: (_) => GroceryListPage());
      case PickupPage.id:
        return MaterialPageRoute(builder: (_) => PickupPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
