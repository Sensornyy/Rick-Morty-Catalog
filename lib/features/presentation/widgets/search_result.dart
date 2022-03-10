import 'package:flutter/material.dart';

import 'package:rickmorty/common/app_colors.dart';
import 'package:rickmorty/common/slide_transition.dart';
import 'package:rickmorty/common/text.dart';
import 'package:rickmorty/features/domain/entities/character_entity.dart';
import 'package:rickmorty/features/presentation/pages/character_details.dart';
import 'package:rickmorty/features/presentation/widgets/cache_image.dart';

class SearchResult extends StatelessWidget {
  final CharacterEntity characterResult;

  SearchResult({required this.characterResult});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.of(context).push(
            slideTransitionTo(
              page: CharacterDetails(character: characterResult),
            ),
          );
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.cellBackground,
          ),
          child: Card(
            child: Column(
              children: [
                CacheImage(width: double.infinity, height: 250, imageUrl: characterResult.image),
                Text(characterResult.name, style: AppTextStyle.title),
                Text(characterResult.location.name, style: AppTextStyle.subtitle)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
