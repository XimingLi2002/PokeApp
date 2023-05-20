      import 'package:flutter_cache_manager/flutter_cache_manager.dart';

final cacheManagerPostsController = CacheManager(Config('cacheManagerPostsKey', maxNrOfCacheObjects: 25));
final cacheManagerPokemonsController = CacheManager(Config('cacheManagerPokemonsKey', maxNrOfCacheObjects: 1000));