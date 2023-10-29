import 'package:flutter/material.dart';
import 'package:loja_virtual/models/section_model.dart';
import 'package:loja_virtual/screen/home/components/section_header.dart';
import 'package:vector_math/vector_math_lists.dart';

class SectionList extends StatelessWidget {
  const SectionList({super.key, required this.section});

  final SectionModel section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(section: section),
        ],
      ),
    );
  }
}
