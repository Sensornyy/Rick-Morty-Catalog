import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String errorMessage;

  ErrorMessage({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Text(errorMessage, style: Theme.of(context).textTheme.caption),
      ),
    );
  }
}
