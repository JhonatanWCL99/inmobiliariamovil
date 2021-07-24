import 'package:flutter/material.dart';
import 'package:si2inmobiliaria_appmovil/pages/favoritos_page.dart';
import 'package:si2inmobiliaria_appmovil/pages/home_page.dart';
import 'package:si2inmobiliaria_appmovil/pages/login_page.dart';
import 'package:si2inmobiliaria_appmovil/pages/planes_page.dart';
import 'package:si2inmobiliaria_appmovil/pages/publicar_page.dart';

class CustomScaffold extends StatelessWidget {
  String appTitle;
  Widget bodyData;
  int index;

  List _screens = [
    HomePage(),
    PlanesPage(),
    FavoritosPage(),
    PublicarPage(),
  ];
  Size deviceSize;
  CustomScaffold({
    this.appTitle,
    this.bodyData,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(200, 100, 55, 10.0),
        title: Text(this.appTitle),
      ),
      drawer: _drawer(context),
      bottomNavigationBar: _bottombar(context),
      body: this.bodyData,
    );
  }

  Widget _drawer(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("Ejemplo@gmail.com"),
              accountName: Text("Ejemplo"),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(200, 100, 55, 10.0)),
              currentAccountPicture: Icon(Icons.account_circle_sharp, size: 80),
            ),
            ListTile(
              leading: Icon(Icons.account_circle_sharp),
              title: Text('Ver Perfil'),
              onTap: () {
                Navigator.pop(context);
              },
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Mensajes'),
              onTap: () {
                Navigator.pop(context);
              },
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              leading: Icon(Icons.cloud_upload),
              title: Text('Anuncios Publicados'),
              onTap: () {
                Navigator.pop(context);
              },
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              leading: Icon(Icons.schedule_outlined),
              title: Text('Anuncios Recientes'),
              onTap: () {
                Navigator.pop(context);
              },
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              leading: Icon(Icons.close_sharp),
              title: Text('Cerrar Sesion'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
              trailing: Icon(Icons.chevron_right),
            ),
          ],
        ),
      );

  Widget _bottombar(BuildContext context) => BottomNavigationBar(
        backgroundColor: Color.fromRGBO(200, 100, 55, 10.0),
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (int index) {
          this.index = index;

          switch (index) {
            case 0:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              break;
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PlanesPage()));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PublicarPage()));
              break;
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoritosPage()));
              break;
            default:
          }
        },
        selectedItemColor: Colors.white,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Planes",
            icon: Icon(Icons.star_rate_rounded),
          ),
          BottomNavigationBarItem(
            label: "Publicar",
            icon: Icon(Icons.publish_outlined),
          ),
          /*   BottomNavigationBarItem(
            label: "Favoritos",
            icon: Icon(Icons.favorite_sharp),
          ), */
        ],
      );
}
