import 'package:flutter/material.dart';
import 'package:si2inmobiliaria_appmovil/widgets/custom_scaffold.dart';

class PublicarPage extends StatefulWidget {
  PublicarPage({Key key}) : super(key: key);

  @override
  _PublicarPageState createState() => _PublicarPageState();
}

class _PublicarPageState extends State<PublicarPage> {
  bool _value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appTitle: "Publicar Page",
      index: 2,
      bodyData: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            elevation: 1,
            child: ListTile(
              /* leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
              ), */
              title: Center(
                  child: Text(
                "Seleccionar Tipo de Inmueble",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              )),
            ),
          ),
          ListTile(
            title: Text("Casas"),
            leading: Radio(
              value: 1,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
              activeColor: Colors.green,
            ),
          ),
          ListTile(
            title: Text("Apartamentos"),
            leading: Radio(
              value: 2,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
              activeColor: Colors.green,
            ),
          ),
          ListTile(
            title: Text("Fincas"),
            leading: Radio(
              value: 3,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
              activeColor: Colors.green,
            ),
          ),
          ListTile(
            title: Text("Locales Comerciales"),
            leading: Radio(
              value: 4,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
              activeColor: Colors.green,
            ),
          ),
          ListTile(
            title: Text("Empresas Industriales"),
            leading: Radio(
              value: 5,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
              activeColor: Colors.green,
            ),
          ),
          ListTile(
            title: Text("Lotes o Parcelas"),
            leading: Radio(
              value: 6,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
              activeColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
