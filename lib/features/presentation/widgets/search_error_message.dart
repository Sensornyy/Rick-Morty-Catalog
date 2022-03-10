import 'package:flutter/material.dart';
import 'package:rickmorty/common/text.dart';

class SearchErrorMessage extends StatelessWidget {
  final String errorMessage;

  SearchErrorMessage({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(errorMessage, style: AppTextStyle.headline),
      ),
    );
  }
}
