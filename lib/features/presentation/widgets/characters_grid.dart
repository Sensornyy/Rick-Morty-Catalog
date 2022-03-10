import 'dart:async';

import 'package:flutter/material.dart';

import 'character_card.dart';
import 'loading_characters.dart';
import 'package:flutter/widgets.dart';
import 'package:rickmorty/features/domain/entities/character_entity.dart';
import 'package:rickmorty/features/presentation/pages/home_page.dart';


class CharactersView extends StatelessWidget {
  List<CharacterEntity> characters;
  bool isLoading;

  CharactersView({required this.isLoading, required this.characters});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: const EdgeInsets.all(20),
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
                Timer(Duration(milliseconds: 48), () {
                  scrollController.jumpTo(scrollController.position.maxScrollExtent);
                });
                return LoadingCharacters();
              }
            },
            childCount: characters.length + (isLoading ? 2 : 0),
          ),
        ));
  }
}
