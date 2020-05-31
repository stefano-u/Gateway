import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rookiehacks/classes/grocery_item.dart';

class AlertDialogContent extends StatefulWidget {
  final GroceryItem item;
  AlertDialogContent({this.item});

  @override
  _AlertDialogContentState createState() => _AlertDialogContentState();
}

class _AlertDialogContentState extends State<AlertDialogContent> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.item.imageUrl),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      widget.item.name,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),


        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          child: Text(
            widget.item.description,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            OutlineButton(
              shape: CircleBorder(),
              child: Icon(Icons.remove),
              onPressed: () {
                if (widget.item.count > 0) {
                  setState(() {
                    widget.item.count--;
                  });
                }
              },
            ),
            Text(
              widget.item.count.toString(),
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            OutlineButton(
              shape: CircleBorder(),
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  widget.item.count++;
                });
              },
            ),
          ],
        ),

        SizedBox(height: 20,)
      ],
    );
  }
}
