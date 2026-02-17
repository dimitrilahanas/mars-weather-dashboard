import 'package:flutter/material.dart';
import 'package:mars_weather_dashboard/models/data_model.dart';
import 'package:mars_weather_dashboard/models/sol_model.dart';
import 'package:mars_weather_dashboard/widgets/data_widget.dart';

class WeatherGrid extends StatelessWidget {
  final SolModel? selectedSol;
  const WeatherGrid({super.key, this.selectedSol});

  @override
  Widget build(BuildContext context) {
    final temperature = selectedSol?.temperature ?? DataModel.zero();
    final season = selectedSol?.season ?? DataModel.zero();
    final windDirection = selectedSol?.windDirection ?? DataModel.zero();
    final windSpeed = selectedSol?.windSpeed ?? DataModel.zero();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.count(
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
        crossAxisCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          DataWidget(dataModel: temperature, unit: "°C"),
          DataWidget(dataModel: season, unit: null),
          DataWidget(dataModel: windDirection, unit: null),
          DataWidget(dataModel: windSpeed, unit: "m/s"),
        ],
      ),
    );
  }
}
