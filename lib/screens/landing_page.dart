import 'package:cinema_app/styles/cinema_theme.dart';
import 'package:cinema_app/ui_views/movies_tablayout_view.dart';
import 'package:cinema_app/ui_views/searchbar_view.dart';
import 'package:cinema_app/ui_views/sub_tablayout_view.dart';
import 'package:cinema_app/ui_views/tablayout_view.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CinemaAppTheme.background,
      body: landingPageUIViews(_tabController),
    );
  }

  Widget landingPageUIViews(TabController tController) => SingleChildScrollView(
        padding: EdgeInsets.only(left: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            SearchBarView(),
            SizedBox(
              height: 40.0,
            ),
            Text(
              "Hi, Rose",
              style: TextStyle(
                  fontFamily: CinemaAppTheme.Poppins,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.0,
                  letterSpacing: 0.3,
                  color: CinemaAppTheme.titleColor),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "What you Gonna watch today ?",
              style: TextStyle(
                  fontFamily: CinemaAppTheme.OpenSans,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.5,
                  letterSpacing: 0.3,
                  color: CinemaAppTheme.subTitleColor),
            ),
            SizedBox(
              height: 40.0,
            ),
            TabLayoutView(
              tabcontroller: tController,
            ),
            SizedBox(
              height: 20.0,
            ),
            MoviesTablayoutView(
              tabController: tController,
            ),
            SizedBox(
              height: 30.0,
            ),
            SubTabLayoutView(
              tabcontroller: tController,
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      );
}
