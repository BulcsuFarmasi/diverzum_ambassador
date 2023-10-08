import 'package:diverzum_ambassador/features/auth/data/auth_handler_response.dart';
import 'package:diverzum_ambassador/features/auth/data/log_in_response.dart';
import 'package:diverzum_ambassador/features/auth/services/auth_remote.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<AuthService> authServiceProvider =
    Provider<AuthService>((Ref ref) => AuthService(ref.read(authRemoteProvider)));

class AuthService {
  final AuthRemote _authRemote;
  String? _email;
  String? _token;

  String? get token => _token;

  AuthService(this._authRemote);

  Future<AuthHandlerResponse> checkEmail(String email) async {
    _email = email;
    return _authRemote.checkEmail(_email!);
  }

  Future<void> logIn(String password) async {
    LogInResponse logInResponse = await _authRemote.logIn(_email!, password);
    _token = logInResponse.access_token;
  }
}
