import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/dio_client.dart';
import '../models/pokemon.dart';

final providerPokemonData = FutureProvider<List<Pokemon>>((ref) async {
  return ref.read(apiProvider).getPokemons();
});
