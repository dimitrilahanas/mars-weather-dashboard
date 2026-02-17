import 'package:flutter/material.dart';
import 'package:mars_weather_dashboard/services/http_services.dart';

class SolSelector extends StatefulWidget {
  const SolSelector({super.key});

  @override
  State<SolSelector> createState() => _SolSelectorState();
}

class _SolSelectorState extends State<SolSelector> {
  late Future<List<String>> _solsFuture;
  String? _selectedSol;

  @override
  void initState() {
    super.initState();
    _solsFuture = HttpServices().getSols();
    _solsFuture.then((sols) {
      if (sols.isNotEmpty) {
        setState(() {
          _selectedSol = sols.last;
        });
      }
    });
  }

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
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
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
            child: FutureBuilder<List<String>>(
              future: _solsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError || !snapshot.hasData) {
                  return const Center(child: Text("Error loading sols"));
                }

                final sols = snapshot.data!;

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sols.length,
                  itemBuilder: (context, index) {
                    final sol = sols[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ChoiceChip(
                        checkmarkColor: Theme.of(context).colorScheme.primary,
                        label: Text(
                          sol,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        selected: _selectedSol == sol,
                        onSelected: (selected) {
                          setState(() {
                            _selectedSol = selected ? sol : null;
                          });
                          // fetch sol data and update UI
                        },
                      ),
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
