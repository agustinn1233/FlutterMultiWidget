import 'package:flutter/material.dart';
import 'package:flutter_application_widget/src/providers/menu_provider.dart';
import 'package:flutter_application_widget/src/utils/icon_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: _lista(),
    );
  }
}

Widget _lista() {
  // Provider
  //menuProvider.loadData().then((value) {
  //print(value);
  //});

  //return ListView(
  //children: _listaItem(),
  //);
  return FutureBuilder(
    future: menuProvider.loadData(), // data a cargar
    initialData: [], // lista vacia.
    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
      print('builder');
      print(snapshot.data);
      return ListView(
        children: _listaItem(snapshot.data, context),
      );
    },
  );
}

List<Widget> _listaItem(List<dynamic> data, BuildContext context) {
  final List<Widget> options = [];
  data.forEach((element) {
    var widgetTemp = ListTile(
      title: Text(element["texto"]),
      leading: getIcon(element["icon"]),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
      onTap: () {
        Navigator.pushNamed(context, element['ruta']);

        // Basic navigation only 1 page.
        //final route = MaterialPageRoute(builder: (context) => AlertPage());
        //Navigator.push(context, route);
      },
    );
    options.add(widgetTemp);
    options.add(Divider());
  });

  return options;
}
