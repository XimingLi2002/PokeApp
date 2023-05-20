import 'package:flutter_riverpod/flutter_riverpod.dart';


final providerPokedexController = AutoDisposeStateProvider<String>((ref) => '');