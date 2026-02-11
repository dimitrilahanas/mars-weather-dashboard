import 'package:flutter/material.dart';
import 'package:mars_weather_dashboard/widgets/data_widget.dart';

class WeatherGrid extends StatelessWidget {
  const WeatherGrid({super.key});

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
          DataWidget(),
          DataWidget(),
          DataWidget(),
          DataWidget(),
        ],
      ),
    );
  }
}