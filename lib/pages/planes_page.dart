import 'package:flutter/material.dart';
import 'package:si2inmobiliaria_appmovil/models/plan_model.dart';
import 'package:si2inmobiliaria_appmovil/widgets/custom_scaffold.dart';

class PlanesPage extends StatefulWidget {
  PlanesPage({Key key}) : super(key: key);

  @override
  _PlanesPageState createState() => _PlanesPageState();
}

class _PlanesPageState extends State<PlanesPage> {
  List<Plan> planes = [
    Plan(id: 1, nombre: "Plan Gratis"),
    Plan(id: 2, nombre: "Plan Suscripcion"),
    Plan(id: 3, nombre: "Plan General"),
    Plan(id: 4, nombre: "Plan Master"),
    Plan(id: 5, nombre: "Plan Completo"),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appTitle: "Planes Page",
      index: 1,
      bodyData: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: planes.length,
        itemBuilder: (context, index) {
          final plan = planes[index];
          return _ItemPlan(
            plan: plan,
          );
        },
      ),
    );
  }
}

class _ItemPlan extends StatelessWidget {
  final Plan plan;
  const _ItemPlan({Key key, this.plan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Icon(
              Icons.star,
              size: 50,
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(plan.nombre),
                const SizedBox(height: 15),
                Text("Descripcion del plan"),
                const SizedBox(height: 15),
                /*  Text("Cantidad de Publicaciones"), */
                /* const SizedBox(height: 15), */
                Text("25 USD"),
              ],
            )),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Colors.deepOrange, Colors.orange]),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    "Adquirir",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
