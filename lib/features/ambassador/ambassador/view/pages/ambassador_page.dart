import 'package:diverzum_ambassador/features/ambassador/ambassador/controller/ambassador_page_state.dart';
import 'package:diverzum_ambassador/features/ambassador/ambassador/controller/ambassador_page_state_notifier.dart';
import 'package:diverzum_ambassador/features/ambassador/ambassador/view/widgets/ambassador_page_load_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AmbassadorPage extends ConsumerStatefulWidget {
  const AmbassadorPage({super.key});

  static const routeName = '/ambassador';

  @override
  ConsumerState<AmbassadorPage> createState() => _AmbassadorPageState();
}

class _AmbassadorPageState extends ConsumerState<AmbassadorPage> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(ambassadorPageStateNotifier.notifier).loadPage(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final AmbassadorPageState ambassadorPageState = ref.watch(ambassadorPageStateNotifier);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: ,),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: switch (ambassadorPageState) {
            PageLoadSuccess pageLoadSuccess => AmbassadorPageLoadSuccess(
                ambassadors: pageLoadSuccess.ambassadors,
                currentPage: pageLoadSuccess.currentPage,
                pageCount: pageLoadSuccess.pageCount,
              ),
            _ => const SizedBox()
          },
        ),
      ),
    );
  }
}
