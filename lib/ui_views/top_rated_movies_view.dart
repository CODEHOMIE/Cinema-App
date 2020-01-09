import 'package:cinema_app/api/services.dart';
import 'package:cinema_app/api/urls.dart';
import 'package:cinema_app/constants/constants.dart';
import 'package:cinema_app/models/trend.dart';
import 'package:cinema_app/screens/view_movie.dart';
import 'package:cinema_app/styles/cinema_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopShowingMovies extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TopShowingMoviesState();
}

class _TopShowingMoviesState extends State<TopShowingMovies>
    with
        TickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<TopShowingMovies> {
  Trend _trend;

  @override
  void initState() {
    super.initState();
    Services.getTrendingMovies().then((TrendsFromServer) {
      setState(() {
        _trend = TrendsFromServer;
      });
    });
  }

  AnimationController animationController;
  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: CinemaAppTheme.background),
      height: MediaQuery.of(context).size.height *
          0.55, // <------------------  card height
      width: double.infinity,
      child: trendsListView(),
    );
  }

  Widget trendsListView() => ListView.builder(
        addAutomaticKeepAlives: true,
        padding: const EdgeInsets.only(bottom: 0, right: 17, left: 0),
        itemCount: _trend == null ? 0 : _trend.results.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
              decoration: BoxDecoration(color: CinemaAppTheme.background),
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Material(
                child: InkWell(
                  splashColor: CinemaAppTheme.background,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewMovieScreen(
                                index: index,
                                movieObj: _trend,
                              )),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(color: CinemaAppTheme.background),
                    width: MediaQuery.of(context).size.width *
                        0.37, // <------------------  card widgth
                    child: showAllUI(index),
                  ),
                ),
              ));
        },
      );

  Widget showAllUI(int index) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            margin: EdgeInsets.only(right: 7.0),
            decoration: BoxDecoration(
                color: CinemaAppTheme.background,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: CinemaAppTheme.background.withOpacity(0.2),
                      offset: Offset(1.1, 4.0),
                      blurRadius: 8.0),
                ],
                image: DecorationImage(
                  image: new NetworkImage(_trend.results[index].poster_path ==
                          null
                      ? ""
                      : "${Urls.image_base_url}${_trend.results[index].poster_path}"),
                  fit: BoxFit.fill,
                )),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Text(
              _trend.results[index].title == null
                  ? _trend.results[index].name
                  : _trend.results[index].title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: Constants.POPPINS,
                  fontSize: 14.5,
                  height: 0.7,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            "3D, iMAX, Cinema",
            maxLines: 1,
            style: TextStyle(
                fontFamily: Constants.POPPINS,
                color: CinemaAppTheme.background,
                fontSize: 9.0,
                fontWeight: FontWeight.w600),
          )
        ],
      );

  @override
  bool get wantKeepAlive => true;
}
