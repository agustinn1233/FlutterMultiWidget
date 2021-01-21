import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  //Scroll controller
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // Metodo que no retorna nada, el super hace referencia la class state y la inicializa.
    // se sobreeescribe para ejecutar el codigo en este preciso instance.
    super.initState();
    _nextImagesLoad();

    // Listener.
    _scrollController.addListener(() {
      print('Scroll');

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_nextImagesLoad();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    // Se dispara cuando la pagina deja de existir en el stack de pag.
    super.dispose();
    _scrollController.dispose(); // prevencion de fuga de memoria.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Listas"),
        ),
        body: Stack(
          children: <Widget>[
            _crearLoading(),
            _crearLista(context),
          ],
        ));
  }

  Widget _crearLista(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _getPage1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length, // cuantos elementos tiene la lista.
        itemBuilder: (context, index) {
          // Numero de la lista
          final image = _listaNumeros[index];

          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300/?image$image'));
          // Servicio web que trabaja con imagenes (esto lo realizo con Picsum)
        }, // Metodo que renderiza los elementos conforme sean necesarios (sirve para el memory lake.)
      ),
    );
  }

  Future _getPage1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear(); // clear list
      _ultimoItem++; // para las siguientes imagenes
      _nextImagesLoad(); // next image
    });
    return Future.delayed(duration);
  }

  void _nextImagesLoad() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));

    _nextImagesLoad();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
