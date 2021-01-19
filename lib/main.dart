import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/home_temp.dart';
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
      routes: rutas,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => PageNoFound());
      },
    );
  }
}
