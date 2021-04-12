import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = '67af5e631dcbb4d0981b06996fcd47bc';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2N2FmNWU2MzFkY2JiNGQwOTgxYjA2OTk2ZmNkNDdiYyIsInN1YiI6IjYwNzQ1OTA0ZjkyNTMyMDAyOTFmZDczYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C_Bkz_T8OybTGo3HfYsESNjN46LBYdw3LHdF-1TzYYs';

  main() async {
    // TMDB tmdb = TMDB(ApiKeys(apikey, readaccesstoken));
    // print(await tmdb.v3.movies.getPouplar());

    // TMDB tmdbWithLogs = TMDB(
    //   ApiKeys(apikey, readaccesstoken),
    //   logConfig: ConfigLogger.showAll(),
    // );
    // print(await tmdbWithLogs.v3.movies.getPouplar());

    // TMDB tmdbWithCustomLogs = TMDB(
    //   ApiKeys(apikey, readaccesstoken),
    //   logConfig: ConfigLogger(
    //     showLogs: true,
    //     showErrorLogs: true,
    //   ),
    // );
    // print(await tmdbWithCustomLogs.v3.movies.getPouplar());
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true, //must be true than only all other logs will be shown
        showErrorLogs: true,
      ),
    );

    Map result = await tmdbWithCustomLogs.v3.trending.getTrending();
    print((result['results'][0]['adult']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Movie App')),
      body: Container(
          child: TextButton(
        child: Text('Show Movies'),
        onPressed: () {
          main();
        },
      )),
    );
  }
}

// https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg
