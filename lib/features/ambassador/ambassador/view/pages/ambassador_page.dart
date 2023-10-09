import 'package:diverzum_ambassador/features/ambassador/ambassador/controller/ambassador_page_state.dart';
import 'package:diverzum_ambassador/features/ambassador/ambassador/controller/ambassador_page_state_notifier.dart';
import 'package:diverzum_ambassador/features/ambassador/ambassador/view/widgets/ambassador_page_load_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset('assets/images/diverzum_logo.png'),
          ),
          leadingWidth: 158,
          actions: [
            const FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              size: 16,
            ),
            const SizedBox(
              width: 18,
            ),
            const FaIcon(
              FontAwesomeIcons.bell,
              size: 16,
            ),
            const SizedBox(
              width: 18,
            ),
            Image.asset(
              'assets/images/profile.png',
              width: 32,
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
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
