import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';

class OperationsDashboardDesktopPage extends StatelessWidget {
  static const String routeName = 'operationsDashboardDesktopPage';
  const OperationsDashboardDesktopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Expanded(
            flex: 1,
            child: OperationsDrawer(),
          ),

        ],
      ),
    );
  }
}
