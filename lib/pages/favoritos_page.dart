import 'package:flutter/material.dart';
import 'package:si2inmobiliaria_appmovil/widgets/custom_scaffold.dart';

class FavoritosPage extends StatefulWidget {
  FavoritosPage({Key key}) : super(key: key);

  @override
  _FavoritosPageState createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appTitle: "Favoritos Page",
      index: 3,
      bodyData: Container(
        child: Center(
          child: Text("FAVORITOS PAGE"),
        ),
      ),
    );
  }
}
