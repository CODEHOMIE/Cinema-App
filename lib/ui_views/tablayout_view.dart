import 'package:cinema_app/styles/cinema_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabLayoutView extends StatelessWidget {
  final tabcontroller;

  TabLayoutView({@required this.tabcontroller});
  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: tabcontroller,
        indicatorColor: Colors.transparent,
        labelColor: Color(0xFF303030),
        isScrollable: true,
        labelPadding: EdgeInsets.only(right: 40.0),
        unselectedLabelColor: Color(0xFFb8b8b8),
        tabs: [
          _tab("Box Office"),
          _tab("Premier"),
          _tab("Trending"),
          _tab("Upcoming")
        ]);
  }

  Widget _tab(String title) => Tab(
        child: Text(title,
            style: TextStyle(
              fontFamily: CinemaAppTheme.Poppins,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            )),
      );
}
