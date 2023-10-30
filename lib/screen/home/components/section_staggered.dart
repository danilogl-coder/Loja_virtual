import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loja_virtual/models/section_model.dart';
import 'package:loja_virtual/screen/home/components/section_header.dart';


class SectionStaggered extends StatelessWidget {
  const SectionStaggered({super.key, required this.section});

  final SectionModel section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          SectionHeader(section: section),
          MasonryGridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemCount: section.items!.length,
          itemBuilder: (context, index) {
          return Image.network(section.items![index].image ?? '', fit: BoxFit.cover,);
          }
          
          ,)
        ],
      ),
    );
  }
}
