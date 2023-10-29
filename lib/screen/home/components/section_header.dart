import 'package:flutter/material.dart';
import 'package:loja_virtual/models/section_model.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.section});

  final SectionModel section;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${section.name}",
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),
    );
  }
}
