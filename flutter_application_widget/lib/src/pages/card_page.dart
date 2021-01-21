import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Pages'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20), // pading en todos los bordes
        children: <Widget>[
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0)
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
        elevation:
            10.0, // sobra que se ve en la tarjeta (se visualiza como una elevacion.)
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.photo_album,
                color: Colors.blue,
              ),
              title: Text("Esta es mi tarjeta"),
              subtitle: Text("Este es el subtitle de la tarjeta"),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.end, // lo pone al final de la tarjeta
              // Botones
              children: <Widget>[
                FlatButton(onPressed: null, child: Text("Cancelar")),
                FlatButton(onPressed: null, child: Text("Aceptar")),
              ],
            )
          ],
        ));
  }

  Widget _cardType2() {
    final card = Container(
      //clipBehavior: Clip.antiAlias, // nada de lo que esta en la tarjeta se salga del contenido de la misma.

      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://iso.500px.com/wp-content/uploads/2014/06/W4A2827-1.jpg'),
            fadeInDuration: Duration(
                milliseconds:
                    200), // tiempo de duracion que demora en aparecer la imagen despues de cargarla.
            height: 300.0,
            fit: BoxFit.cover,
          ),
          //Image(
          //image: NetworkImage(
          //  'https://iso.500px.com/wp-content/uploads/2014/06/W4A2827-1.jpg'),
          //),
          Container(
              padding: EdgeInsets.all(10.0), child: Text('No se que poner'))
        ],
      ),
    );
    return Container(
      // no cambia sus propiedades
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 20.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0))
        ],
        //color: Colors.red,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: card,
      ),
    );
  }
}
