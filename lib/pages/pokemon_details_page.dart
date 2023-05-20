import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


import '../enums/app_colors.dart';
import '../models/pokemon.dart';
import '../providers/controllers/cache_manager_controller.dart';
import '../widgets/pokemon_id_widget.dart';
import '../widgets/pokemon_types.dart';
import '../widgets/property_value_widget.dart';

class PokemonDetailsPage extends ConsumerWidget {
  final Pokemon pokemon;
  const PokemonDetailsPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_outlined,
            size: 24,
          ),
          onTap: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Imagen del pokemon
              CachedNetworkImage(
                key: UniqueKey(),
                cacheManager: cacheManagerPokemonsController,
                imageUrl: pokemon.source,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  size: 40,
                ),
              ),
              const SizedBox(height: 25),
              //Contenedor que tiene los datos del pokemon
              Card(
                color: AppColors.primary50.color,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Pokemon y id
                        PokemonId(
                            id: pokemon.id,
                            pokemon: pokemon.pokemon,
                            fontSize: 26),
                        const SizedBox(height: 6),
                        //Descripción
                        Text(
                          pokemon.description,
                          style: textTheme.bodyMedium!.copyWith(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 6),
                        //Habilidad
                        PropertyValue(
                            property: "Habilidad: ", value: pokemon.ability),
                        const SizedBox(height: 6),
                        //Habilidad oculta
                        pokemon.hiddenAbility.isNotEmpty
                            ? PropertyValue(
                                property: "Habilidad oculta: ",
                                value: pokemon.hiddenAbility)
                            : const SizedBox(),
                        const SizedBox(height: 6),
                        //Tipos
                        Row(
                          children: [
                            Text(
                              "${pokemon.type.length > 1 ? "Tipos" : "Tipo"}: ",
                              style: textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            PokemonTypes(types: pokemon.type, width: 100),
                          ],
                        ),
                        const SizedBox(height: 6),
                        //Generación
                        PropertyValue(
                            property: "Generación: ",
                            value: "${pokemon.generation.name} (${pokemon.generation.id})")
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
