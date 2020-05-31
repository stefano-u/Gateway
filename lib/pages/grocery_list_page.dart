import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/search_bar/gf_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rookiehacks/classes/grocery_item.dart';
import 'package:rookiehacks/components/data_storage.dart';
import 'package:rookiehacks/components/grocery_item_card.dart';
import 'package:rookiehacks/constants.dart';
import 'package:rookiehacks/pages/pickup_page.dart';

class GroceryListPage extends StatefulWidget {
  static const String id = 'grocery_list_page';

  @override
  _GroceryListPageState createState() => _GroceryListPageState();
}

class _GroceryListPageState extends State<GroceryListPage> {
  List<GroceryItem> _groceryItems = [];
  int _groceryInCartCount = 0;

  void _navigateToHomePage() {
    Navigator.pop(context);
  }

  void _getNumItemsWithPurchase() {
    _groceryInCartCount = 0;
    for (var i = 0; i < _groceryItems.length; i++) {
      if (_groceryItems[i].count > 0) {
        _groceryInCartCount++;
      }
    }
  }
  List<Widget> _generateShoppingCarItems() {
    List<Widget> itemRow = [];
    for (var i = 0; i < _groceryItems.length; i++) {
      if (_groceryItems[i].count > 0) {
        itemRow.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _groceryItems[i].name,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Text(
                'x' + _groceryItems[i].count.toString(),
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      }
    }
    return itemRow;
  }

  void _showOrderResult() {
    _getNumItemsWithPurchase();

    AlertDialog alert = AlertDialog(
      insetPadding: EdgeInsets.all(10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Text(
              _groceryInCartCount > 0 ? 'Order these groceries?' : 'No items in cart',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 40),
            child: Center(
              child: Text(
                _groceryInCartCount > 0 ? 'Double check these are the groceries you want to order.' : 'Please select items to buy first!',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xFF666666)
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Column(
              children: _generateShoppingCarItems(),
            ),
          ),

          _groceryInCartCount > 0 ? FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            color: kGreenColor,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Text(
              'Confirm',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              _showTotal();
            },
          ) : Text(''),
          FlatButton(
            child: Text(
              'Cancel',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: kGreenColor,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _showTotal() {
    AlertDialog alert = AlertDialog(
      insetPadding: EdgeInsets.all(10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Your estimated total is:',
            textAlign: TextAlign.left,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 40),
            child: Text(
              '\$20.50',
              textAlign: TextAlign.left,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
              ),
            ),
          ),

          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            color: kGreenColor,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Text(
              'Place Order',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, PickupPage.id);
            },
          ),
          FlatButton(
            child: Text(
              'Cancel',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: kGreenColor,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final dataContainer = UserDataContainer.of(context);
    _groceryItems = dataContainer.groceryItems;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: _navigateToHomePage,
            child: Center(
              child: Text(
                'Back',
                style: GoogleFonts.inter(
                  color: Color(0xFF5DB075),
                  fontSize: 16,
                ),
              ),
            ),
          ),
          title: Center(
            child: Text(
              'Groceries',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: _navigateToHomePage,
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: kGreenColor,
                  ),
                  onPressed: _showOrderResult,
                ),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GFSearchBar(
                searchList: _groceryItems,
                overlaySearchListHeight: 0,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _groceryItems.length,
                itemBuilder: (context, index) {
                  if (index < _groceryItems.length) {
                    return GroceryItemCard(item: _groceryItems[index]);
                  }
                  return null;
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(95, 0, 20, 0),
                    child: Divider(
                      color: Colors.grey.shade300,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
