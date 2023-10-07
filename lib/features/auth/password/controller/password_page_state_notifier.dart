import 'package:diverzum_ambassador/features/auth/password/controller/password_page_state.dart';
import 'package:diverzum_ambassador/features/auth/password/model/password_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<PasswordPageStateNotifier, PasswordPageState> passwordPageStateProvider =
    StateNotifierProvider<PasswordPageStateNotifier, PasswordPageState>(
  (Ref ref) => PasswordPageStateNotifier(ref.read(passwordRepositoryProvider)),
);

class PasswordPageStateNotifier extends StateNotifier<PasswordPageState> {
  PasswordPageStateNotifier(this._passwordRepository) : super(const PasswordPageState.initial());

  final PasswordRepository _passwordRepository;

  Future<void> logIn (String password) async {
    await _passwordRepository.logIn(password);
    state = const PasswordPageState.success();
  }
}
