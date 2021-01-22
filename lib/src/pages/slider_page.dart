import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearImagen(),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.black,
      label: "Tamaño de la imagen $_valorSlider",
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (valor) {
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Center(
      child: FadeInImage(
        width: _valorSlider,
        image: NetworkImage('https://i.blogs.es/594843/chrome/450_1000.jpg'),
        placeholder: AssetImage('assets/jar-loading.gif'),
      ),
    );
  }
}
