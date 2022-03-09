import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rickmorty/features/domain/entities/character_entity.dart';
import 'package:shimmer/shimmer.dart';

import 'character_card.dart';

class CharactersView extends StatelessWidget {
  List<CharacterEntity> characters;
  bool isLoading;

  CharactersView({required this.isLoading, required this.characters});

@override
  Widget build(BuildContext context) {
    return SliverPadding(
          padding:  const EdgeInsets.all(20),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.48,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (index < characters.length) {
                      return CharacterCard(characters[index]);
                    } else {
                      return  Shimmer.fromColors(
                          baseColor: Colors.grey[400]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(height: 90, width: 40,
                              decoration: BoxDecoration(
                                color:Colors.grey,
                              borderRadius: BorderRadius.circular(10)))
                      );
                    }
              },
              childCount: characters.length + (isLoading ? 2 : 0),
            ),
          )

    );
  }
}
