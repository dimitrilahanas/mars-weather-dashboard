import 'package:flutter/material.dart';
import 'package:mars_weather_dashboard/models/data_model.dart';

class DataWidget extends StatelessWidget {
  final DataModel dataModel;
  final String? unit;
  const DataWidget({super.key, required this.dataModel, this.unit});

  @override
  Widget build(BuildContext context) {
    TextStyle styleTemplate = TextStyle(
      color: Theme.of(context).colorScheme.onPrimary,
      fontWeight: FontWeight.w600,
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, bottom: 20, right: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(dataModel.label, style: styleTemplate.copyWith(fontSize: 18)),

            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text("${dataModel.data} + ${unit ?? ''}", style: styleTemplate.copyWith(fontSize: 33)),
            ),
          ],
        ),
      ),
    );
  }
}
