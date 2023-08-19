import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Lcation Screen"),
      ),
    );
  }
}
