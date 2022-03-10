import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickmorty/common/text.dart';
import 'package:rickmorty/features/domain/entities/character_entity.dart';

class SearchResult extends StatelessWidget {
  final CharacterEntity characterResult;

  SearchResult({required this.characterResult});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
      child: Column(children: [
        Text(characterResult.name, style: AppTextStyle.title)
      ],),
    );
  }
}
