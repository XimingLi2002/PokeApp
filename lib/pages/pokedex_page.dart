import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/pokedex_data_provider.dart';
import '../providers/pokedex_provider.dart';
import '../routes/named_routes.dart';
import '../widgets/pokemon_id_widget.dart';
import '../widgets/pokemon_types.dart';

class PokedexWidget extends ConsumerWidget {
  const PokedexWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(providerPokedexController);
    final textTheme = Theme.of(context).textTheme;
    final data = ref.watch(providerPokemonData);
    return Scaffold(
      appBar: AppBar(
        title: AnimatedSearchBar(
          label: "Pokedex",
          labelStyle: textTheme.titleLarge!,
          searchDecoration: InputDecoration(
              hintText: "Buscar",
              hintStyle: textTheme.bodyLarge,
              alignLabelWithHint: true,
              fillColor: Colors.white,
              border: InputBorder.none),
          onChanged: (value) =>
              ref.read(providerPokedexController.notifier).state = value,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
            onRefresh: () async {
              // ignore: unused_result
              ref.refresh(providerPokemonData);
            },
            child: data.when(
              data: (data) {
                final pokedexCopy = data
                    .where((element) => element.pokemon.toLowerCase().contains(
                        ref.read(providerPokedexController).toLowerCase()))
                    .toList();
                return CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          print(index);
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 4),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              leading: Image.network(pokedexCopy[index].source),
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 3.0),
                                child: PokemonId(
                                  id: pokedexCopy[index].id,
                                  pokemon: pokedexCopy[index].pokemon,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: PokemonTypes(
                                  types: pokedexCopy[index].type, width: 85),
                              trailing: const Icon(Icons.navigate_next),
                              onTap: () {
                                context.pushNamed(pokemonDetails,
                                    extra: pokedexCopy[index]);
                              },
                            ),
                          );
                        },
                        childCount: pokedexCopy.length,
                      ),
                    ),
                  ],
                );
              },
              error: ((error, stackTrace) => Text(error.toString())),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            )),
      ),
    );
  }
}
