import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmorty/common/app_colors.dart';
import 'package:rickmorty/common/text.dart';
import 'package:rickmorty/features/domain/entities/character_entity.dart';
import 'package:rickmorty/features/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:rickmorty/features/presentation/widgets/search_error_message.dart';
import 'package:rickmorty/features/presentation/widgets/search_result.dart';
import 'package:shimmer/shimmer.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate() : super(searchFieldLabel: 'Search for characters...', searchFieldStyle: AppTextStyle.caption);

  final _suggestions = ['Rick Sanchez', 'Morty Smith', 'Summer Smith'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    BlocProvider.of<SearchBloc>(context, listen: false)..add(Search(query));
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return Shimmer.fromColors(
            baseColor: AppColors.cellBackground,
            highlightColor: Colors.grey[600]!,
            child: Container(
              height: 90,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        } else if (state is SearchLoaded) {
          final character = state.characters;
          if (character.isEmpty) {
            return SearchErrorMessage(errorMessage: 'No characters found :(');
          }
          return ListView.builder(
            itemCount: character.isNotEmpty ? character.length : 0,
            itemBuilder: (BuildContext context, int index) {
              CharacterEntity characterResult = character[index];
              return SearchResult(characterResult: characterResult,);
            });
        } else if (state is SearchError) {
          return SearchErrorMessage(errorMessage: state.errorMessage);
        } else {
          return Center(
            child: Image.asset('assets/images/error_image.png'),
          );
        }
      }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length > 0) {
      return const SizedBox();
    }
    return ListView.separated(
      padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => Text(_suggestions[index], style: AppTextStyle.caption),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: _suggestions.length);
  }
}
