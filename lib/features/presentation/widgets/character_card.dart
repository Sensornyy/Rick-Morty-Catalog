import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickmorty/common/app_colors.dart';
import 'package:rickmorty/features/domain/entities/character_entity.dart';

import 'cache_image.dart';

class CharacterCard extends StatelessWidget {
  final CharacterEntity character;

  CharacterCard(this.character);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cellBackground,
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
                  style: Theme.of(context).textTheme.bodyText1,
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
              Text('Last known location: ', style: Theme.of(context).textTheme.subtitle1)
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
              Text('Origin: ', style: Theme.of(context).textTheme.subtitle1)
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
    );
  }
}
