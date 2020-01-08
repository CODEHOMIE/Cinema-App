import 'package:cinema_app/ui_views/top_rated_movies_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoviesTablayoutView extends StatefulWidget {
  final tabController;

  MoviesTablayoutView({@required this.tabController});

  @override
  State<StatefulWidget> createState() => _MoviesTablayoutState();
}

class _MoviesTablayoutState extends State<MoviesTablayoutView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      child: TabBarView(
        controller: widget.tabController,
        children: <Widget>[
          TopShowingMovies(),
          TopShowingMovies(),
          TopShowingMovies(),
          TopShowingMovies(),
        ],
      ),
    );
  }
}
