import 'package:flutter/material.dart';

class AmbassadorPaginationItem extends StatelessWidget {
  const AmbassadorPaginationItem({
    super.key,
    required this.text,
    required this.active,
    required this.disabled,
    required this.pageSelected,
    required this.page,
  });

  final String text;
  final int page;
  final bool active;
  final bool disabled;
  final PageSelected pageSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled
          ? null
          : () {
              pageSelected(page);
            },
      child: Text(text),
    );
  }
}

typedef PageSelected = void Function(int page);
