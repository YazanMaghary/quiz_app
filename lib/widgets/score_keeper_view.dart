import 'package:flutter/material.dart';

class ScoreKeeperView extends StatelessWidget {
  const ScoreKeeperView({
    super.key,
    required this.scoreKeeper,
  });

  final List<bool> scoreKeeper;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: scoreKeeper
            .map((e) => e
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.close,
                    color: Colors.red,
                  ))
            .toList());
  }
}
