import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _block = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Page"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Size image",
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_block)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
              print(valor);
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://i.blogs.es/3b9334/el-caballero-oscuro-la-leyenda-renace-1446020992/1366_2000.jpeg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  /*Widget _checkBox() {
    return Checkbox(
        value: _block,
        onChanged: (_block)
            ? null
            : (block) {
                setState(() {
                  _block = block;
                });
              });
  }*/

  Widget _checkBox() {
    return CheckboxListTile(
        title: Text("Bloquear slider por checkbox"),
        value: _block,
        onChanged: (valor) {
          setState(() {
            _block = valor;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text("Bloquear slider por switch"),
        value: _block,
        onChanged: (valor) {
          setState(() {
            _block = valor;
          });
        });
  }
}
