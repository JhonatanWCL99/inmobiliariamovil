import 'package:flutter/material.dart';
import 'package:si2inmobiliaria_appmovil/pages/home_page.dart';
import 'package:si2inmobiliaria_appmovil/pages/login_page.dart';
import 'package:si2inmobiliaria_appmovil/widgets/custom_scaffold.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: LoginPage());
  }
}
