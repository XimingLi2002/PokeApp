import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/bottom_navigation_bar.dart';

class DashboardPage extends ConsumerStatefulWidget {
  final Widget child;
  const DashboardPage({required this.child, Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: widget.child, bottomNavigationBar: const CustomBottomNavigationBar(),);
  }
}