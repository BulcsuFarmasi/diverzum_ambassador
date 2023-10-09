import 'package:diverzum_ambassador/features/ambassador/ambassador/view/widgets/ambassador_pagination.dart';
import 'package:diverzum_ambassador/features/ambassador/ambassador/view/widgets/ambassador_table.dart';
import 'package:diverzum_ambassador/features/ambassador/data/ambassador.dart';
import 'package:flutter/material.dart';

class AmbassadorPageLoadSuccess extends StatelessWidget {
  const AmbassadorPageLoadSuccess(
      {super.key, required this.ambassadors, required this.currentPage, required this.pageCount});

  final List<Ambassador> ambassadors;
  final int currentPage;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: AmbassadorTable(
              ambassadors: ambassadors,
            ),
          ),
        ),
        const SizedBox(
          height: 48,
        ),
        AmbassadorPagination(
          currentPage: currentPage,
          pageCount: pageCount,
        ),
      ],
    );
  }
}
