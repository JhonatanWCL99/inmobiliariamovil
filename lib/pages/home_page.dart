import 'package:flutter/material.dart';
import 'package:si2inmobiliaria_appmovil/models/publicacion_model.dart';
import 'package:si2inmobiliaria_appmovil/widgets/custom_scaffold.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Publicacion> publicaciones = [
    Publicacion(id: 1, descripcion: "Plan Gratis"),
    Publicacion(id: 2, descripcion: "Plan Suscripcion"),
    Publicacion(id: 3, descripcion: "Plan General"),
    Publicacion(id: 4, descripcion: "Plan Master"),
    Publicacion(id: 5, descripcion: "Plan Completo"),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appTitle: "Home Page",
      index: 0,
      bodyData: Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: publicaciones.length,
          itemBuilder: (context, index) {
            final publicacion = publicaciones[index];
            return _ItemPublicacion(
              publicacion: publicacion,
            );
          },
        ),
      ),
    );
  }
}

class _ItemPublicacion extends StatelessWidget {
  final Publicacion publicacion;
  const _ItemPublicacion({Key key, this.publicacion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInImage(
              placeholder: AssetImage('assets/images/giphy.gif'),
              image: AssetImage('assets/images/casa1.jpg'),
            ),
            /* Ink.image(
              height: 200,
              image: AssetImage('assets/images/casa1.jpg'),
              fit: BoxFit.fitWidth,
            ), */
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Plan',
                  style: TextStyle(color: Colors.black54),
                ),
                Text(publicacion.descripcion),
                Text('Precio : 25Sus')
              ],
            ),

            /* Expanded(child: ButtonBar()), */
          ],
        ),
      ),
    );
  }
}
