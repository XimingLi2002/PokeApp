import 'dart:convert';

import 'package:flutter/services.dart';
import '../models/pokemon.dart';


//TODO NO USADO [Esto es lo que se utiliza para leer un archivo json local pero como lo he hecho en una base de datos, se ha quedado sin utilizar]
class PokedexService {
  Future<List<Pokemon>> fetchPokemons() async {
    final String response =
        await rootBundle.loadString('assets/pokemon_es.json');
    final data = await json.decode(response) as List<dynamic>;
    return data.map((element) => Pokemon.fromJson(element)).toList();
  }
}
