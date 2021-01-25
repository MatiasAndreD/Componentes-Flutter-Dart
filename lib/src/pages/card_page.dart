import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cards")),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(
            height: 10.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 10.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 10.0,
          ),
          _cardTipo2(),
          _cardTipo1(),
          SizedBox(
            height: 10.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 10.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 10.0,
          ),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Center(
        child: Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text("Esto es un titulo"),
            subtitle: Text("Esto es un subtitulo"),
            onTap: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text("Ok"),
                onPressed: () => {},
              ),
              TextButton(
                child: Text("Ver"),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    ));
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://www.arohatours.co.nz/media/1645/banner_queenstown-g.jpg?mode=crop&height=700&width=1920&quality=80'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          /* Image(
            image: NetworkImage(
                'https://www.arohatours.co.nz/media/1645/banner_queenstown-g.jpg?mode=crop&height=700&width=1920&quality=80'),
          ), */
          Container(
              padding: EdgeInsets.all(10.0), child: Text("No tengo que poner"))
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 5.0),
          ]),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
