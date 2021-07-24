import 'package:flutter/cupertino.dart';

class Publicacion {
  Publicacion({
    this.id,
    this.descripcion,
    this.zona,
    this.costo,
    this.foto,
    this.cuartos,
    this.banos,
    this.cantpublicaciones,
  });

  int id;
  String descripcion;
  String zona;
  String cuartos;
  String banos;
  String costo;
  Image foto;
  String cantpublicaciones;
}
