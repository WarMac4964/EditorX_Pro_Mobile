import 'package:editorx_pro/provider/edited.dart';
import 'package:editorx_pro/screens/about_screen.dart';
import 'package:editorx_pro/screens/editing_screen.dart';
import 'package:editorx_pro/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Edited()),
        ChangeNotifierProvider(create: (context) => ColorMode()),
      ],
      child: MaterialApp(
        title: 'FilmSnap',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: HomeScreen(),
        routes: {
          EditingScreen.routeName: (ctx) => EditingScreen(),
          AboutScreen.routeName: (ctx) => AboutScreen(),
        },
      ),
    );
  }
}
