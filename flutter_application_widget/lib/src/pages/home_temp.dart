import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compoenentes Temp"),
      ),
      body: ListView(children: _crearItemsShort()),
    );
  }

// Basic option
  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>(); // Lista dinamica.
    for (var opt in options) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      //lista.add(tempWidget); // Agrego a la lista
      //lista.add(Divider()); //
      lista..add(tempWidget)..add(Divider());
    }

    return lista;
  }

// Best option.
  List<Widget> _crearItemsShort() {
    return options
        .map((e) => Column(
              children: [
                ListTile(
                  title: Text(e + "!"),
                  subtitle: Text("Hola"),
                  leading: Icon(Icons.account_balance_wallet),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {},
                ),
                Divider(),
              ],
            ))
        .toList();
  }
}
