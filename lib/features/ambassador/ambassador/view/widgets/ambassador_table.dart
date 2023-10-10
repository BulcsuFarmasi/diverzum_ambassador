import 'package:diverzum_ambassador/features/ambassador/data/ambassador.dart';
import 'package:diverzum_ambassador/shared/app_colors.dart';
import 'package:flutter/material.dart';

class AmbassadorTable extends StatelessWidget {
  const AmbassadorTable({super.key, required this.ambassadors});

  final List<Ambassador> ambassadors;

  @override
  Widget build(BuildContext context) {
    const TextStyle tableTextStyle = TextStyle(fontSize: 22, color: AppColors.titleColor);
    final TextStyle tableTextStyleBold = tableTextStyle.copyWith(fontWeight: FontWeight.w700);
    final TextStyle tableTextStyleFirst = tableTextStyle.copyWith(color: AppColors.authBackgroundColor);
    final TextStyle tableTextStyleBoldFirst = tableTextStyleBold.copyWith(color: AppColors.authBackgroundColor);

    return Table(
      columnWidths: const {
        0: FixedColumnWidth(50),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(48),
      },
      children: ambassadors
          .map(
            (Ambassador ambassador) => TableRow(
              decoration: BoxDecoration(
                color: ambassador.position == 1
                    ? AppColors.primaryColor
                    : ambassador.position % 2 == 1
                        ? AppColors.tableOddRowColor
                        : null,
                boxShadow: ambassador.position == 1
                    ? [const BoxShadow(color: AppColors.tableShadowColor, offset: Offset(0, 15), blurRadius: 11, spreadRadius: -6)]
                    : null,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Text(
                    '${ambassador.position}',
                    style: ambassador.position == 1 ? tableTextStyleBoldFirst : tableTextStyleBold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Row(
                    children: [
                      if (ambassador.badgeImage != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Image.asset(
                            ambassador.badgeImage!,
                            height: 48,
                          ),
                        ),
                      Text(
                        ambassador.name,
                        style: ambassador.position == 1 ? tableTextStyleFirst : tableTextStyle,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    '${ambassador.userCount}',
                    style: ambassador.position == 1 ? tableTextStyleBoldFirst : tableTextStyleBold,
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
