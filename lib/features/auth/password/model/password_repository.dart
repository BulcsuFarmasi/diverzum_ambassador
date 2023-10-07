import 'package:diverzum_ambassador/features/auth/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<PasswordRepository> passwordRepositoryProvider = Provider<PasswordRepository>(
  (Ref ref) => PasswordRepository(
    ref.read(authServiceProvider),
  ),
);

class PasswordRepository {
  PasswordRepository(this._authService);

  final AuthService _authService;

  Future<void> logIn(String password) async {
    _authService.logIn(password);
  }
}
