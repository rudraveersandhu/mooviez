import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quad_movies/screens/splash_screen.dart';

import 'api_services/api_services.dart';
import 'models/model.dart';
import 'models/search_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchModel(),
      child: MaterialApp(
        title: 'Netflix Style App',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
