import 'package:flutter/material.dart';
import 'package:rickmorty/common/app_colors.dart';

import 'package:rickmorty/features/presentation/widgets/characters.dart';
import 'package:rickmorty/features/presentation/widgets/custom_search_delegate.dart';
import 'package:rickmorty/features/presentation/widgets/custom_sliver_app_bar.dart';

final ScrollController scrollController = ScrollController();

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainBackground,
        child: const Icon(Icons.search, color: Colors.white),
        mini: true,
        onPressed: () {
          showSearch(context: context, delegate: CustomSearchDelegate());
        },
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverPersistentHeader(
            delegate: CustomSliverAppBar(expandedHeight: 200),
            pinned: true,
          ),
          CharactersClass(),
        ],
      ),
    );
  }
}
