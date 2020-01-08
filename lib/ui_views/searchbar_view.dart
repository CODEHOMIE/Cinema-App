import 'package:cinema_app/styles/cinema_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 0.0),
              decoration: BoxDecoration(
                color: CinemaAppTheme.searchBarBg,
                borderRadius: BorderRadius.all(Radius.circular(8.0))
              ), 

            ),
          ),
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
          SizedBox(width: 15.0,)
        ],
      ),
    );
  }
}
