import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/widgets/button_widget.dart';

import '../providers/controllers/cache_manager_controller.dart';
import '../services/url_launcher_service.dart';
import '../widgets/post_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            //tipos : https://blog.logrocket.com/how-to-add-sliverappbar-to-your-flutter-app/
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 24, bottom: 16),
                title: Text(
                  "Inicio",
                  style: textTheme.titleLarge,
                ),
                background: CachedNetworkImage(
                  key: UniqueKey(),
                  cacheManager: cacheManagerPostsController,
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRX3CB_8ewqRoN40vPt_7_BlRwW60y11cCufQ&usqp=CAU",
                  imageBuilder: (context, imageProvider) => Container(
                    width: double.infinity,
                    height: 175,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error, size: 40)),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Builder(builder: (context) {
          return Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    CustomPost(
                      postDate: "12 de mayo 2023",
                      title:
                          "Zarala (Traje S) y Tapu Bulu llegan a Pokémon Masters EX",
                      imageUrl:
                          "https://www.pokemon.com/static-assets/content-assets/cms2-es-es/img/video-games/_tiles/pokemon-masters/2023/05122023/pokemon-masters-ex-169.png",
                      body: "Zarala forma equipo con el Pokémon Dios Nativo.",
                      onTap: () async => ref
                          .read(providerUrlLauncherManager)
                          .launchUrlOnExternalApp(
                              'https://www.pokemon.com/es/noticias-pokemon/zarala-traje-s-y-tapu-bulu-llegan-a-pokemon-masters-ex'),
                    ),
                    CustomPost(
                      postDate: "12 de mayo de 2023",
                      title: "Explora cuevas con Ash y Pikachu en TV Pokémon",
                      imageUrl:
                          "https://www.pokemon.com/static-assets/content-assets/cms2-es-es/img/watch-pokemon-tv/_tiles/stunts/cave-escapades/cave-escapades-169-es.png",
                      body:
                          "Adéntrate en esta colección de episodios de la serie Pokémon en los que Ash y sus amigos exploran cuevas.",
                      onTap: () async => ref
                          .read(providerUrlLauncherManager)
                          .launchUrlOnExternalApp(
                              'https://www.pokemon.com/es/noticias-pokemon/explora-cuevas-con-ash-y-pikachu-en-tv-pokemon'),
                    ),
                    CustomPost(
                      postDate: "11 de mayo de 2023",
                      title:
                          "Mega-Pinsir y Tapu Fini variocolor debutan en el evento Heroicidad Valerosa de Pokémon GO",
                      imageUrl:
                          "https://www.pokemon.com/static-assets/content-assets/cms2-es-es/img/video-games/_tiles/pokemon-go/2023/05112023/pokemon-go-169.png",
                      body:
                          "Saca todo el partido a las megaincursiones, disfruta de bonus del evento y pásalo en grande con una nueva historia de investigación especial.",
                      onTap: () async => ref
                          .read(providerUrlLauncherManager)
                          .launchUrlOnExternalApp(
                              'https://www.pokemon.com/es/noticias-pokemon/mega-pinsir-y-tapu-fini-variocolor-debutan-en-el-evento-heroicidad-valerosa-de-pokemon-go'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
