// @dart=2.9
import 'package:flutter/material.dart';
import 'package:movies/utils/text.dart';
import 'package:movies/widgets/toprated.dart';
import 'package:movies/widgets/trending.dart';
import 'package:movies/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      theme:
          ThemeData(brightness: Brightness.light, primaryColor: Colors.red[900]),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '64fff99b83a7c2d057dd1a893ee6aa03';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NGZmZjk5YjgzYTdjMmQwNTdkZDFhODkzZWU2YWEwMyIsInN1YiI6IjYxZTNjN2MyOTA0ZjZkMDA2NmRkZDRkMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.y-RP_js4AGGGvOOAqG115MaiFhHIYxUzJeCQCBoaUgE';

  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });

    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      appBar: AppBar(backgroundColor: Colors.red[900],
        title: modified_text( text: 'Flutter Movies App',color: Colors.white,size: 26,),
      ),
      body: ListView(
        children: [
          TV(tvshows:tv),
          TopRatedMovies(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies),
        ],
      ),
    );
  }
}
