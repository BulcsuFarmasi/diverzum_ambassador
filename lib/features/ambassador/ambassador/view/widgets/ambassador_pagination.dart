import 'package:diverzum_ambassador/features/ambassador/ambassador/controller/ambassador_page_state_notifier.dart';
import 'package:diverzum_ambassador/features/ambassador/ambassador/view/widgets/ambassador_pagination_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AmbassadorPagination extends ConsumerStatefulWidget {
  const AmbassadorPagination({required this.currentPage, required this.pageCount, super.key});

  final int currentPage;
  final int pageCount;

  @override
  ConsumerState<AmbassadorPagination> createState() => _AmbassadorPaginationState();
}

class _AmbassadorPaginationState extends ConsumerState<AmbassadorPagination> {
  late List<int> pages;

  @override
  void initState() {
    super.initState();

    pages = [];
    for (int i = 1; i <= widget.pageCount; i++) {
      pages.add(i);
    }
  }

  void _changePage(int page) {
    ref.read(ambassadorPageStateNotifier.notifier).loadPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AmbassadorPaginationItem(
          disabled: widget.currentPage == 1,
          page: widget.currentPage - 1,
          first: true,
          text: '«',
          pageSelected: _changePage,
        ),
        for (int page in pages)
          AmbassadorPaginationItem(
            active: page == widget.currentPage,
            page: page,
            text: '$page',
            pageSelected: _changePage,
          ),
        AmbassadorPaginationItem(
          disabled: widget.currentPage == widget.pageCount,
          page: widget.currentPage + 1,
          last: true,
          text: '»',
          pageSelected: _changePage,
        )
      ],
    );
  }
}
