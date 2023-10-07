import 'package:diverzum_ambassador/features/auth/data/auth_handler_response.dart';
import 'package:diverzum_ambassador/features/auth/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<EmailRepository> emailRepositoryProvider = Provider<EmailRepository>(
  (Ref ref) => EmailRepository(
    ref.read(authServiceProvider),
  ),
);

class EmailRepository {
  EmailRepository(this._authService);

  final AuthService _authService;

  Future<bool> checkEmail(String email) async {
    final AuthHandlerResponse authHandlerResponse = await _authService.checkEmail(email);

    return authHandlerResponse.status == login;
  }

  static const String login = "login";
}
