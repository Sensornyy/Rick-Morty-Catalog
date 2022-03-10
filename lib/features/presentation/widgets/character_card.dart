import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickmorty/common/app_colors.dart';
import 'package:rickmorty/common/text.dart';
import 'package:rickmorty/features/domain/entities/character_entity.dart';
import 'package:rickmorty/features/presentation/bloc/characters_list/characters_list_cubit.dart';
import 'package:rickmorty/features/presentation/pages/character_details.dart';
import 'package:rickmorty/common/slide_transition.dart';

import 'cache_image.dart';

class CharacterCard extends StatelessWidget {
  final CharacterEntity character;

  CharacterCard(this.character);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.of(context).push(
            slideTransitionTo(
              page: CharacterDetails(character: character),
            ),
          );
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.cellBackground,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SizedBox(
                  child: CacheImage(
                    imageUrl: character.image,
                    width: double.infinity,
                    height: 130,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        character.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.title,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(width: 5),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: character.status == 'Alive'
                            ? Colors.green
                            : character.status == 'Dead'
                                ? Colors.red
                                : Colors.grey,
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                          '${character.status == 'unknown' ? 'Unknown' : character.status} - ${character.species == 'Mythological Creature' ? 'Myth Creature' : character.species}'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 5),
                    Text('Last known location: ', style: AppTextStyle.subtitle)
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                          '${character.location.name == 'unknown' ? 'Uknown' : character.location.name}',
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 5),
                    Text('Origin: ', style: AppTextStyle.subtitle)
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                          '${character.origin.name == 'unknown' ? 'Uknown' : character.origin.name}'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
