import 'package:flutter/material.dart';
import 'package:mars_weather_dashboard/models/sol_model.dart';
import 'package:mars_weather_dashboard/widgets/data_widget.dart';

class WeatherGrid extends StatelessWidget {
  final SolModel selectedSol;
  const WeatherGrid({super.key, required this.selectedSol});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: GridView.count(
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
        crossAxisCount: 2,
        physics: NeverScrollableScrollPhysics(),
        children: [
          DataWidget(dataModel: selectedSol.temperature, unit: "°C",),
          DataWidget(dataModel: selectedSol.season, unit: null),
          DataWidget(dataModel: selectedSol.windDirection, unit: null),
          DataWidget(dataModel: selectedSol.windSpeed, unit: "m/s"),
        ],
      ),
    );
  }
}