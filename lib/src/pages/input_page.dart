import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _date = "";
  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = ['Volar', 'Fuerza', 'Rayos X', 'Ninguno'];

  TextEditingController _inputFieldDateController = new TextEditingController();

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
            Divider(),
            _crearEmail(),
            Divider(),
            _inputPassword(),
            Divider(),
            _inputDate(context),
            Divider(),
            _crearDropdown(),
            Divider(),
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

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          counter: Text('Letra ' + _email.length.toString()),
          hintText: 'Email',
          labelText: 'Email',
          helperText: 'Pon tu correo electronico',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _inputPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Password',
          labelText: 'Password',
          helperText: 'Pon una clave para tu cuenta',
          suffixIcon: Icon(Icons.vpn_key),
          icon: Icon(Icons.lock)),
      onChanged: (valor) {
        setState(() {});
      },
    );
  }

  Widget _inputDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          helperText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_view_day)),
      onChanged: (valor) {
        setState(
          () {
            _date = valor;
            _inputFieldDateController.text = _date;
          },
        );
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1930),
        lastDate: new DateTime(2023),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  Widget _crearNombres() {
    return ListTile(
      title: Text("El nombre es: $_nombre"),
      subtitle: Text("Email:$_email y la fecha: " + _date.toString()),
      trailing: Text(_opcionSeleccionada),
    );
  }

  List<DropdownMenuItem<String>> getOpciones() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: [
        Icon(Icons.power),
        SizedBox(
          width: 30.0,
        ),
        DropdownButton(
          value: _opcionSeleccionada,
          items: getOpciones(),
          onChanged: (opt) {
            setState(() {
              _opcionSeleccionada = opt;
            });
          },
        )
      ],
    );
  }
}
