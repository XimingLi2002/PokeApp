import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:network_info_plus/network_info_plus.dart';

import '../models/pokemon.dart';

//API SERVICE Provider
final apiProvider = Provider<PokemonAPI>((ref) => PokemonAPI());

class PokemonAPI {
  //TODO not working
  _getIP() async {
    await Permission.location.request();
    final info = NetworkInfo();
    var hostAddress = await info.getWifiIP();
    return hostAddress;
  }

  final Dio _dio = Dio();
  // Empresa
  // final String endpoint = 'http://192.168.26.49:8080/pokemons';
  // Casa
   final String endpoint = 'http://192.168.1.128:8080/pokemons';

  Future<List<Pokemon>> getPokemons({required}) async {
    //TODO INVESTIGAR GET LOCAL IP Y VINCULAR API
    // final baseUrl = await _getIP();
    // final endpoint = 'http://$baseUrl:8080/pokemons';

    final prefs = await SharedPreferences.getInstance();
    try {
      Response response =
          await _dio.get(endpoint).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        prefs.setString('poke_data', jsonEncode(response.data));

        // Parsing the raw JSON data to the class
        return (response.data as List)
            .map<Pokemon>((e) => Pokemon.fromJson(e))
            .toList();
      } else {
        throw Exception(response.statusCode);
      }

      // Prints the raw data returned by the server
      // print('Data: ${response.data}');
    } on DioError {
      if (prefs.getString('poke_data') != null) {
        return (jsonDecode(prefs.getString('poke_data')!) as List)
            .map<Pokemon>((e) => Pokemon.fromJson(e))
            .toList();
      } else {
        return [];
      }
    } on TimeoutException {
      if (prefs.getString('poke_data') != null) {
        return (jsonDecode(prefs.getString('poke_data')!) as List)
            .map<Pokemon>((e) => Pokemon.fromJson(e))
            .toList();
      } else {
        return [];
      }
    }
  }
}
