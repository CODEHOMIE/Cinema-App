import 'package:cinema_app/styles/cinema_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubTabLayoutView extends StatelessWidget {
  final tabcontroller;

  SubTabLayoutView({@required this.tabcontroller});
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
          _tab("News"),
          _tab("Payment"),
          _tab("Promo"),
          _tab("Service")
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
