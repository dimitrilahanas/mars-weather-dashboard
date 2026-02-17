import 'package:flutter/material.dart';
import 'package:mars_weather_dashboard/models/sol_model.dart';
import 'package:mars_weather_dashboard/services/http_services.dart';

class SolSelector extends StatefulWidget {
  final ValueChanged<SolModel?> onSolSelected;
  const SolSelector({super.key, required this.onSolSelected});

  @override
  State<SolSelector> createState() => _SolSelectorState();
}

class _SolSelectorState extends State<SolSelector> {
  late Future<List<int>> _solNumbersFuture;
  int? _selectedSolNumber;
  final HttpServices _http = HttpServices();

  @override
  void initState() {
    super.initState();
    _solNumbersFuture = _http.getAvailableSols();
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
            child: FutureBuilder<List<int>>(
              future: _solNumbersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError || !snapshot.hasData) {
                  return const Center(child: Text("Error loading sols"));
                }

                final solNumbers = snapshot.data!;

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: solNumbers.length,
                  itemBuilder: (context, index) {
                    final solNumber = solNumbers[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ChoiceChip(
                        checkmarkColor: Theme.of(context).colorScheme.primary,
                        label: Text(
                          "Sol $solNumber",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        selected: _selectedSolNumber == solNumber,
                        onSelected: (selected) async {
                          if (!selected) return;

                          setState(() {
                            _selectedSolNumber = solNumber;
                          });

                          final sol = await _http.getSol(solNumber);
                          widget.onSolSelected(sol);
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
