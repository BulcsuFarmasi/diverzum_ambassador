import 'package:diverzum_ambassador/shared/app_colors.dart';
import 'package:flutter/material.dart';

class AmbassadorPaginationItem extends StatelessWidget {
  const AmbassadorPaginationItem({
    super.key,
    required this.text,
    required this.pageSelected,
    required this.page,
    this.active = false,
    this.disabled = false,
    this.first = false,
    this.last = false,
  });

  final String text;
  final int page;
  final bool active;
  final bool disabled;
  final bool first;
  final bool last;
  final PageSelected pageSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled
          ? null
          : () {
              pageSelected(page);
            },
      child: Container(
        decoration: BoxDecoration(
            color: active
                ? AppColors.paginationActiveBackgroundColor
                : disabled
                    ? AppColors.paginationDisabledBackgroundColor
                    : AppColors.paginationBackgroundColor,
            border: Border.all(
              color: active ? AppColors.paginationActiveBorderColor : AppColors.paginationBorderColor,
            ),
            borderRadius: BorderRadius.only(
              topLeft: first ? const Radius.circular(6) : Radius.zero,
              bottomLeft: first ? const Radius.circular(6) : Radius.zero,
              topRight: last ? const Radius.circular(6) : Radius.zero,
              bottomRight: first ? const Radius.circular(6) : Radius.zero,
            )),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              color: active
                  ? AppColors.paginationActiveTextColor
                  : disabled
                      ? AppColors.paginationDisabledTextColor
                      : AppColors.paginationTextColor),
        ),
      ),
    );
  }
}

typedef PageSelected = void Function(int page);
