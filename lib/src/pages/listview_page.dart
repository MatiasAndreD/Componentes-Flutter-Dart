import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoding = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        /* _agregar10(); */
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List View Page"),
        ),
        body: Stack(
          children: [_crearLisView(), _crearLoading()],
        ));
  }

  _crearLisView() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.symmetric(vertical: 8.0),
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
            image:
                NetworkImage('https://picsum.photos/1080/720?random=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 1; i <= 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future fetchData() async {
    _isLoding = true;
    setState(() {});
    final duration = new Duration(seconds: 2);

    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoding = false;
    _scrollController.animateTo(_scrollController.position.pixels + 50.0,
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 500));
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoding) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0),
        ],
      );
    } else {
      return Container();
    }
  }
}
