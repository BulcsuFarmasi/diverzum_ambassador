import 'package:diverzum_ambassador/features/auth/data/login_exception.dart';
import 'package:diverzum_ambassador/features/auth/data/login_response.dart';
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

  Future<void> login(String password) async {
    final LoginResponse loginResponse = await _authService.login(password);
    if (loginResponse.errors != null) {
      throw LoginException();
    }
  }
}
