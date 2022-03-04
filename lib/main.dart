import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/widgets/nowplaying.dart';
import 'package:movies/widgets/toprated.dart';
import 'package:movies/widgets/trending.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: const Color(0xFF01061A)),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List nowplaying = [];
  List toprated = [];

  final String apikey = 'c6a36b80cc4c15edf75aebb21bb21aa9';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNmEzNmI4MGNjNGMxNWVkZjc1YWViYjIxYmIyMWFhOSIsInN1YiI6IjYyMWNkM2U0MWJmODc2MDA2ZDA0ZTE2NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9iXkniH8iSTwd6XTae31P_cU94WLM93kl-6QMtQ1HLE';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingresult = await tmdbWithCustomLogs.v3.movies.getPopular();
    Map nowplayingresult = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();

    setState(() {
      nowplaying = nowplayingresult['results'];
      trendingmovies = trendingresult['results'];
      toprated = topratedresult['results'];
    });
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF01061A),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text('SeeMovies',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )),
      ),
      body: ListView(
        children: [
          NowPlaying(nowplaying: nowplaying),
          TrendingMovies(trending: trendingmovies),
          TopRated(toprated: toprated),
          Text('Copyright© 2022 SeeMovies | Design By Fajar Wahyu Gumelar',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ))
        ],
      ),
    );
  }
}
