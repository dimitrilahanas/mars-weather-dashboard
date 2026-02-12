import 'package:flutter/material.dart';

class SolSelector extends StatelessWidget {
  const SolSelector({super.key});

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
            Text(
              "Available Sols:",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Text("hi", style: TextStyle(color: Colors.black)),
                  Text("hi", style: TextStyle(color: Colors.black)),
                ],
              ),
            )
          ],
        ),
    );
  }
}
