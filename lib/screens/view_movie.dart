import 'package:cinema_app/api/urls.dart';
import 'package:cinema_app/constants/constants.dart';
import 'package:cinema_app/styles/cinema_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewMovieScreen extends StatefulWidget {
  final movieObj, index;

  ViewMovieScreen({this.movieObj, this.index});
  @override
  State<StatefulWidget> createState() => _ViewMovieScreenState();
}

class _ViewMovieScreenState extends State<ViewMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CinemaAppTheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[upperPart()],
            ),
          ],
        ),
      ),
    );
  }

  Widget upperPart() => Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: new NetworkImage(
                      "${Urls.image_base_url}${widget.movieObj.results[widget.index].backdrop_path}",
                    ),
                    fit: BoxFit.cover,
                  )),
                ),
                gradientShadow(),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3),
                  child: headingPart(),
                )
              ],
            ),
          ),
        ],
      );

  Widget gradientShadow() => Container(
        decoration: BoxDecoration(
            color: CinemaAppTheme.background,
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [CinemaAppTheme.background, Colors.transparent])),
      );

  Widget headingPart() => Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.movieObj.results[widget.index].title == null
                            ? widget.movieObj.results[widget.index].name
                            : widget.movieObj.results[widget.index].title,
                        style: TextStyle(
                            fontFamily: Constants.POPPINS,
                            fontSize: 20.0,
                            height: 0.9,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        widget.movieObj.results[widget.index].name == null
                            ? widget.movieObj.results[widget.index].media_type
                            : widget.movieObj.results[widget.index].name,
                        style: TextStyle(
                            fontFamily: Constants.POPPINS,
                            fontSize: 14.0,
                            height: 0.9,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                          "${widget.movieObj.results[widget.index].overview}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: Constants.OPEN_SANS,
                              fontSize: 13.0),
                        ),
                      SizedBox(
                        width: 20.0,
                      ),
                    ],
                  ),
            ],
          ),
        ),
      );
}
