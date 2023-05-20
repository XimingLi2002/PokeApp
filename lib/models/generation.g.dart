// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Generation _$GenerationFromJson(Map<String, dynamic> json) => Generation(
      id: json['id'] as int,
      name: json['name'] as String,
      pokemons: (json['pokemons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Pokemon.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$GenerationToJson(Generation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'generation': instance.name,
      'pokemons': instance.pokemons?.toList(),
    };
