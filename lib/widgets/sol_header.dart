import 'package:flutter/material.dart';
import 'package:mars_weather_dashboard/models/sol_model.dart';

class SolHeader extends StatelessWidget {
  final SolModel? selectedSol;
  const SolHeader({super.key, this.selectedSol});

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
            "Sol ${selectedSol?.solNumber ?? '-'}",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
