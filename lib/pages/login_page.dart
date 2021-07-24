import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:si2inmobiliaria_appmovil/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  static final String routeName = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    /*   _checkIfLoggedIn(); */
  }

  /* void _checkIfLoggedIn() async {
    // check if token is there
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        //_isLoggedIn = true;
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      });
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    ));
  }

  Widget _loginForm(BuildContext context) {
    // final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        SafeArea(
          child: Container(
            height: 180.0,
          ),
        ),
        Container(
          width: size.width * 0.85,
          margin: EdgeInsets.symmetric(vertical: 30.0),
          padding: EdgeInsets.symmetric(vertical: 50.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0)
              ]),
          child: Column(
            children: <Widget>[
              Text('Ingreso', style: TextStyle(fontSize: 20.0)),
              SizedBox(height: 60.0),
              _crearEmail(),
              SizedBox(height: 30.0),
              _crearPassword(),
              SizedBox(height: 30.0),
              _crearBoton()
            ],
          ),
        ),
        Text('¿Olvido la contraseña?'),
        SizedBox(height: 100.0)
      ],
    );
  }

  Widget _crearEmail() {
    return StreamBuilder(
      //stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.alternate_email,
                    color: Color.fromRGBO(200, 100, 55, 10.0)),
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo electrónico',
                counterText: snapshot.data,
                errorText: snapshot.error),
            //    onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword() {
    return StreamBuilder(
      //stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock_outline,
                    color: Color.fromRGBO(200, 100, 55, 10.0)),
                labelText: 'Contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error),
            //    onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearBoton() {
    // formValidStream
    // snapshot.hasData
    //  true ? algo si true : algo si false

    return StreamBuilder(
      //stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Ingresar'),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            color: Color.fromRGBO(200, 100, 55, 10.0),
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
              /*  login(); */
            });
      },
    );
  }

  /*  Future login() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'email': emailController.text,
      'password': passwordController.text
    };
    Api api = Api();
    var res = await api.postData(data, 'login');
    var body = json.decode(res.body);
    if (body['token'] != null) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      /* final status_to_save = LoginUserResponse.fromJson(json.decode(res.body)); */
      localStorage.setString('token', body['token']);
      /* localStorage.setString('idPaciente', status_to_save.userLogin.name); */
      print(body['token']);
      ToastMessage.showToast("Se inicio Sesion con éxito. \n ", this.context);
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      _isLoading = false;
    });
  } */

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoOrange = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(200, 100, 55, 10.0),
        Color.fromRGBO(200, 100, 55, 10.0)
      ])),
    );

    return Stack(
      children: <Widget>[
        fondoOrange,
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.home, color: Colors.white, size: 100.0),
              SizedBox(height: 10.0, width: double.infinity),
              Text('Inmobiliaria',
                  style: TextStyle(color: Colors.white, fontSize: 25.0))
            ],
          ),
        )
      ],
    );
  }
}
