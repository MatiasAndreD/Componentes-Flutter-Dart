import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

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
            _crearCheckbox(),
            _crearSwitch(),
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
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
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

  Widget _crearCheckbox() {
    return CheckboxListTile(
      title: Text("Desactivar Slider"),
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
      activeColor: Colors.black,
      value: _bloquearCheck,
      checkColor: Colors.white,
    );
    /* return Row(
      children: [
        Checkbox(
          onChanged: (valor) {
            setState(() {
              _bloquearCheck = valor;
            });
          },
          activeColor: Colors.black,
          value: _bloquearCheck,
          hoverColor: Colors.green,
        ),
        Text("Bloquear Slider")
      ],
    ); */
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text("Desactivar Slider"),
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
      activeColor: Colors.black,
      value: _bloquearCheck,
    );
  }
}
