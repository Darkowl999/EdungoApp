import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoryRepository {
  String url = "https://edungobolivia.com/api/categorias";
  String url2 = "https://edungobolivia.com/api/areas";
  String url3 = "https://edungobolivia.com/api/materias";
  String url4 = "https://edungobolivia.com/api/auxiliaresMateria";

  Future<List> loadCategories() async {
    try {
      http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      const JsonDecoder decoder = const JsonDecoder();
      return decoder.convert(response.body);
    } on Exception catch (_) {
      return null;
    }
  }

  Future<List> loadMaterias(String id) async {
    try {
      http.Response response = await http.post(
        url3,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id_area': id,
        }),
      );
      const JsonDecoder decoder = const JsonDecoder();
      return decoder.convert(response.body);
    } on Exception catch (_) {
      return null;
    }
  }

  Future<List> loadAreas(String id) async {
    try {
      http.Response response = await http.post(
        url2,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id_categoria': id,
        }),
      );
      const JsonDecoder decoder = const JsonDecoder();
      return decoder.convert(response.body);
    } on Exception catch (_) {
      return null;
    }
  }

  Future<List> loadAuxiliares(String id_materia) async {
    try {
      http.Response response = await http.post(
        url4,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id_materia': id_materia,
        }),
      );
      const JsonDecoder decoder = const JsonDecoder();
      return decoder.convert(response.body);
    } on Exception catch (_) {
      return null;
    }
  }


}
