import 'package:flutter/material.dart';

class SolHeader extends StatelessWidget {
  const SolHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Mars Weather Overview",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Sol 112",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
