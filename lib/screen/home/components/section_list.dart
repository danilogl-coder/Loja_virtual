import 'package:flutter/material.dart';
import 'package:loja_virtual/models/section_model.dart';
import 'package:loja_virtual/screen/home/components/item_tile.dart';
import 'package:loja_virtual/screen/home/components/section_header.dart';

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
          SizedBox(
            height: 150,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ItemTile(
                    item: section.items![index]
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 4.0,
                    ),
                itemCount: section.items!.length),
          )
        ],
      ),
    );
  }
}
