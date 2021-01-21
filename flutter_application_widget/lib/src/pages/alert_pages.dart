import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Mostrar Alerta"),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlerta(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            //shape: RoundedRectangleBorder(
            //borderRadius: BorderRadius.circular(20.0)), // para poner los bordes redondeados en la alerta.
            title: Text("Titulo"),
            content: Column(
              mainAxisSize: MainAxisSize
                  .min, // contenido interno dice que tan ancho es la alerta.
              children: <Widget>[
                Text("Este es el contenido de la alerta"),
                FlutterLogo(
                  size: 50.0,
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancelar")),
              FlatButton(onPressed: null, child: Text("Aceptar")),
            ],
          );
        });
  }
}
