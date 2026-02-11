import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({super.key});

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
            Text("Temperature", style: styleTemplate.copyWith(fontSize: 18)),

            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text("10°C", style: styleTemplate.copyWith(fontSize: 33)),
            ),
          ],
        ),
      ),
    );
  }
}
