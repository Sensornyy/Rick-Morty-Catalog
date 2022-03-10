import 'package:flutter/material.dart';
import 'package:rickmorty/common/text.dart';

class ServerErrorMessage extends StatelessWidget {
  final String errorMessage;

  ServerErrorMessage({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Text(errorMessage, style: AppTextStyle.headline),
      ),
    );
  }
}
