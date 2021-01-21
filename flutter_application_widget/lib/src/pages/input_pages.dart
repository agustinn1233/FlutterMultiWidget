import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _opcionSelect = "Itau";
  List _bancos = ['Itau', 'Stantander', 'Scotiabank'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Pages"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // configuraciones
      autofocus: false, // focus cuando entra a la pagina
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        // personalizacion del input.
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        counter: Text("Letras ${_nombre.length}"),
        hintText: "Nombre de la persona",
        labelText: "Nombre",
        helperText: "Solo es el nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
        print(_nombre);
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es $_nombre"),
      subtitle: Text("E-Mail $_email"),
      trailing: Text("$_opcionSelect"),
    );
  }

  Widget _crearEmail() {
    return TextField(
      // configuraciones
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        // personalizacion del input.
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        counter: Text("Letras ${_email.length}"),
        hintText: "E-Mail de la persona",
        labelText: "Email",
        helperText: "Solo es el nombre",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.mail),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
        print(_email);
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      // configuraciones
      obscureText: true, // for password encrypt
      decoration: InputDecoration(
        // personalizacion del input.
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        counter: Text("Letras ${_password.length}"),
        hintText: "Password",
        labelText: "Password",
        helperText: "Password de la cuenta",
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });
        print(_password);
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        // personalizacion del input.
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        counter: Text("Letras ${_fecha.length}"),
        hintText: "Fecha de nacimiento",
        labelText: "Fecha de nacimiento",
        helperText: "Password de la cuenta",
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2021),
        lastDate: new DateTime(2030),
        locale: Locale('es', 'ES'));

    // validate
    if (picked != null) {
      // mostrar valor de la fecha
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> lista = new List();

    _bancos.forEach((element) {
      lista.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });

    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
            child: DropdownButton(
          value: _opcionSelect,
          items: getOptionsDropdown(),
          onChanged: (opt) {
            setState(() {
              _opcionSelect = opt;
            });
          },
        ))
      ],
    );
  }
}
