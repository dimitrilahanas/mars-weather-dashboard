import 'package:flutter/material.dart';
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
          )
        ),
      ),

      body: WeatherGrid(),
    );
  }
}