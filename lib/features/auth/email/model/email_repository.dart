import 'package:diverzum_ambassador/features/auth/data/auth_handler_response.dart';
import 'package:diverzum_ambassador/features/auth/services/auth_service.dart';
import 'package:diverzum_ambassador/shared/http/network_excpetion.dart';
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
    try {

    final AuthHandlerResponse authHandlerResponse = await _authService.checkEmail(email);

    return authHandlerResponse.status == login;
    } on NetworkException {
      rethrow;
    }
  }

  static const String login = "login";
}
