import 'package:flutter/material.dart';
import 'package:mars_weather_dashboard/services/http_services.dart';

class SolSelector extends StatelessWidget {
  final httpServices = new HttpServices();
  SolSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Available Sols:",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: httpServices.getSols(),
              builder: (context, snapshot) {
                final sols = snapshot.data!;
                return ListView.builder(
                  itemCount: sols.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Chip(label: Text(sols[index])),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
