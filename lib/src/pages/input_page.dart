import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inputs'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: [
            _crearInputs(),
            _crearNombres(),
          ],
        ));
  }

  Widget _crearInputs() {
    return TextField(
      /* autofocus: true, */
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          counter: Text('Letra ' + _nombre.length.toString()),
          hintText: 'Nombre',
          labelText: 'Nombre',
          helperText: 'Solo es el nombre',
          suffixIcon: Icon(Icons.person),
          icon: Icon(Icons.accessibility)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearNombres() {
    return ListTile(
      title: Text("El nombre es: $_nombre"),
    );
  }
}
