import 'package:flutter/material.dart';
import 'package:rickmorty/common/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCharacters extends StatelessWidget {
  const LoadingCharacters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.cellBackground,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 90,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
