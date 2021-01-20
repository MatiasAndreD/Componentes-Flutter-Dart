import 'package:componentes/src/pages/page_not_found.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComponentesApp',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      /* home: HomePage(), */
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => PageNoFound());
      },
    );
  }
}
