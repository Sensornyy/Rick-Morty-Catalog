import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmorty/features/domain/entities/character_entity.dart';

import 'package:rickmorty/features/presentation/pages/home_page.dart' ;
import 'package:rickmorty/features/presentation/bloc/characters_list/characters_list_cubit.dart';
import 'package:rickmorty/features/presentation/widgets/loading_indicator.dart';
import 'characters_grid.dart';
import 'server_error_message.dart';
import 'loading_characters.dart';
import 'loading_grid.dart';

class CharactersClass extends StatelessWidget {


  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<CharactersListCubit>().loadCharacters();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);

    return BlocBuilder<CharactersListCubit, CharactersListState>(builder: (context, state) {
      List<CharacterEntity> characters = [];

      bool isLoading = false;

      if (state is CharactersListLoading && state.isFirstFetch) {
        return LoadingGrid();
      } else if (state is CharactersListLoading) {
        characters = state.oldCharacterList;
        isLoading = true;
      } else if (state is CharactersListLoaded) {
        characters = state.characterList;
      } else if (state is CharactersListError) {
        return ServerErrorMessage(errorMessage: state.errorMessage);
      }
      return CharactersView(isLoading: isLoading, characters: characters,);
    });
  }
}
