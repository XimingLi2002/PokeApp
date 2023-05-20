import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// TODO No usado
class CustomPokemonTypeImage extends ConsumerWidget {
  
  final String text;
  final List<String> type;
  final double width;
  const CustomPokemonTypeImage(
      {super.key, required this.text, required this.type, required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> emptyType = List.filled(6, "", growable: true);
    emptyType.replaceRange(0, type.length, type);
    return GridView(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 4, crossAxisSpacing: 4, childAspectRatio: 3.5),
      children: [
        const Center(
          child: SizedBox(
            width: 105,
            child: Text(
              "Debilidades: ",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        TypeWidget(emptyType[0]),
        TypeWidget(emptyType[0]),
        TypeWidget(emptyType[0]),
        TypeWidget(emptyType[0]),
        TypeWidget(emptyType[4]),
      ],
    );
  }
}


Widget TypeWidget(String type){
  if (type.isNotEmpty) {
    return Image(
            image: AssetImage(
                "assets/images/pokemon_types/${type.toLowerCase()}.png"),
            filterQuality: FilterQuality.high,
          );
  }else{
    return Container();
  }
}