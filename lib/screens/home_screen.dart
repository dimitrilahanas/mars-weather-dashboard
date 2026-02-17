import 'package:flutter/material.dart';
import 'package:mars_weather_dashboard/models/sol_model.dart';
import 'package:mars_weather_dashboard/widgets/sol_header.dart';
import 'package:mars_weather_dashboard/widgets/sol_selector.dart';
import 'package:mars_weather_dashboard/widgets/weather_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SolModel? _selectedSol;

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
              padding: const EdgeInsets.only(bottom: 50),
              child: SolHeader(selectedSol: _selectedSol,),
            ),
          ),

          Expanded(
            child: WeatherGrid(selectedSol: _selectedSol),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: SolSelector(
              onSolSelected: (sol) {
                setState(() {
                  _selectedSol = sol;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
