import 'package:flutter/material.dart';

class PageNoFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("No FOUND"),
      ),
      body: Center(
        child: Text("Pagina no encontrada"),
      ),
    );
  }
}
