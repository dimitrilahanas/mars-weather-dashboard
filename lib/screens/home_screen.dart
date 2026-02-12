import 'package:flutter/material.dart';
import 'package:mars_weather_dashboard/widgets/sol_header.dart';
import 'package:mars_weather_dashboard/widgets/sol_selector.dart';
import 'package:mars_weather_dashboard/widgets/weather_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 50, left: 0),
              child: SolHeader(),
            ),
          ),

          Expanded(child: WeatherGrid()),

          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: SolSelector(),
          ),
        ],
      ),
    );
  }
}
