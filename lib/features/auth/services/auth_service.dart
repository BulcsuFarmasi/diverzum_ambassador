import 'package:diverzum_ambassador/features/auth/data/auth_handler_response.dart';
import 'package:diverzum_ambassador/features/auth/services/auth_remote.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<AuthService> authServiceProvider =
    Provider<AuthService>((Ref ref) => AuthService(ref.read(authRemoteProvider)));

class AuthService {
  final AuthRemote _authRemote;

  AuthService(this._authRemote);

  Future<AuthHandlerResponse> checkEmail(String email) async {
    return _authRemote.checkEmail(email);
  }
}
