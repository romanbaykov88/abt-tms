import 'dart:ui';

import 'package:tms/models/cargo_details.dart';

class EditorScreenArguments {
  final CargoDetails cargo;
  final List<String> dispatchers;
  final List<String> statuses;
  final List<String> brokers;
  final List<String> companies;
  final List<Color> colors;

  EditorScreenArguments({
    required this.cargo,
    required this.dispatchers,
    required this.statuses,
    required this.brokers,
    required this.companies,
    required this.colors,
  });
}
