import 'package:flutter/material.dart';
import 'package:to_dos_state_management/views/plan_screen.dart';

void main() {
  runApp(MasterPlanApp());
}

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlanScreen(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
