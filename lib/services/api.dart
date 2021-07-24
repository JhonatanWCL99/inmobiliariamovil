import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  final String _url = 'http://192.168.0.21:8000/api/';

  Future<List<dynamic>> getPlanes() async {
    http.Response response = await http.get(_url + 'planes');
    if (response.statusCode == 200) {
      print('petición correcta');
      final jsonData = jsonDecode(response.body);
      List<dynamic> mapDatos = jsonData;
      return mapDatos;
    } else {
      return null;
    }
  }

  Future<List<dynamic>> publicar(
    String descripcion,
    String fechaatencion,
    String horaatencion,
    int pacienteid,
    int servicioid,
  ) async {
    http.Response response = await http.post(_url + 'solicitud', body: {
      'descripcion': descripcion,
      'fecha_atencion': fechaatencion,
      'hora_atencion': horaatencion,
      'paciente_id': pacienteid.toString(),
      'servicio_id': servicioid.toString(),
    });

    if (response.statusCode == 200) {
      print('petición correcta');
      print(response.statusCode);

      /*      final jsonData = jsonDecode(response.body); */
    } else {
      print(response.statusCode);
      return null;
    }
  }

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.get(fullUrl, headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }
}
