import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rickmorty/common/app_colors.dart';

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  CustomSliverAppBar({required this.expandedHeight});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      //clipBehavior: Clip.antiAlias,
      children: [
        Image(
          image: AssetImage('assets/images/rick_and_morty.png'),
          fit: BoxFit.cover,
        ),
        Opacity(
          opacity: shrinkOffset / expandedHeight,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.cellBackground,
            ),
          ),
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Rick & Morty Catalog',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
