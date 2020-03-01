import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // scaffoldBackgroundColor: Color(0xFFEFEEEE),
        scaffoldBackgroundColor: Color(0xFF17191c),
        appBarTheme: AppBarTheme(
          elevation: 0,
          // color: Color(0xFFEFEEEE),
          color: Color(0xFF3c494f),
          actionsIconTheme: IconThemeData(
            // color: Colors.grey[600]
            color: Color(0xFFd7e6e6)
          ),
          iconTheme: IconThemeData(
            color: Colors.grey[600]
          ),
          textTheme: TextTheme(
            title: TextStyle(
              // color: Colors.grey.shade900,
              color: Color(0xffd7e6e6),
              fontSize: 25
            )
          )
        ),
        cardColor: Color(0xff353a40)
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
