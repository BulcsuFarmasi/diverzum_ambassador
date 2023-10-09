import 'package:diverzum_ambassador/features/ambassador/ambassador/controller/ambassador_page_state.dart';
import 'package:diverzum_ambassador/features/ambassador/ambassador/model/ambassador_respository.dart';
import 'package:diverzum_ambassador/features/ambassador/data/ambassador.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<AmbassadorPageStateNotifier, AmbassadorPageState> ambassadorPageStateNotifier =
    StateNotifierProvider<AmbassadorPageStateNotifier, AmbassadorPageState>(
  (Ref ref) => AmbassadorPageStateNotifier(ref.read(ambadassorRepositoryProvider)),
);

class AmbassadorPageStateNotifier extends StateNotifier<AmbassadorPageState> {
  AmbassadorPageStateNotifier(this._ambassadorRepository) : super(const AmbassadorPageState.initial());
  
  final AmbassadorRepository _ambassadorRepository;

  Future<void> loadPage(int page) async {
    List<Ambassador> ambassadorsPerPage = await _ambassadorRepository.getAmbassadorPage(page);

    state = AmbassadorPageState.pageLoadSuccess(ambassadorsPerPage, page, _ambassadorRepository.pageCount!);
  }
}
