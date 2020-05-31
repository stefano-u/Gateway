import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rookiehacks/pages/home_page.dart';

import '../constants.dart';

class PickupPage extends StatefulWidget {
  static const String id = 'pickup_page';

  @override
  _PickupPageState createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {
  void _navigateToHomePage() {
    Navigator.popAndPushNamed(context, HomePage.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
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
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset('assets/active.png'),
              Image.network(
                "https://www.google.com/maps/about/images/mymaps/mymaps-desktop-16x9.png",
              ),
              Image.asset('assets/derek.png'),
              Card(
                margin: EdgeInsets.zero,
                elevation: 50,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Derek is picking up your groceries.',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Please be patient while Derek picks out the best groceries for you. If you\'d like, you can even leave them a tip!',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.inter(
                          fontSize: 12.5,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'How much would you like to tip?',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: RaisedButton(
                              elevation: 0,
                              shape: CircleBorder(),
                              color: kGreenColor,
                              child: FittedBox(
                                child: Text(
                                  '\$2',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              padding: EdgeInsets.all(20),
                              onPressed: () {},
                            ),
                          ),
                          Flexible(
                            child: RaisedButton(
                              elevation: 0,
                              shape: CircleBorder(
                                  side: BorderSide(color: kGreenColor)),
                              color: Colors.white,
                              child: FittedBox(
                                child: Text(
                                  '\$3',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              padding: EdgeInsets.all(20),
                              onPressed: () {},
                            ),
                          ),
                          Flexible(
                            child: RaisedButton(
                              elevation: 0,
                              shape: CircleBorder(
                                  side: BorderSide(color: kGreenColor)),
                              color: Colors.white,
                              child: FittedBox(
                                child: Text(
                                  '\$4',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              padding: EdgeInsets.all(20),
                              onPressed: () {},
                            ),
                          ),
                          Flexible(
                            child: RaisedButton(
                              elevation: 0,
                              shape: CircleBorder(
                                  side: BorderSide(color: kGreenColor)),
                              color: Colors.white,
                              child: FittedBox(
                                child: Text(
                                  'Other',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              padding: EdgeInsets.all(20),
                              onPressed: () {},
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
