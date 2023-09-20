import "package:flutter/material.dart";

class SearchDialog extends StatelessWidget {
  const SearchDialog({super.key, this.initialText});

  final String? initialText;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2.0,
          left: 2.0,
          right: 2.0,
          child: Card(
            child: TextFormField(
              initialValue: initialText,
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                prefixIcon: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              onFieldSubmitted: (text) {
                Navigator.of(context).pop(text);
              },
            ),
          ),
        )
      ],
    );
  }
}
