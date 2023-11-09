import 'package:flutter/material.dart';
import 'package:movies_search/search/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SearchScreen.routeName: (context) => SearchScreen(),
      },
      initialRoute: SearchScreen.routeName,
    );
  }
}
