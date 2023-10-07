import 'package:diverzum_ambassador/features/auth/data/auth_handler_response.dart';
import 'package:diverzum_ambassador/features/auth/services/auth_remote.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<AuthService> authServiceProvider =
    Provider<AuthService>((Ref ref) => AuthService(ref.read(authRemoteProvider)));

class AuthService {
  final AuthRemote _authRemote;
  String? _email;

  AuthService(this._authRemote);

  Future<AuthHandlerResponse> checkEmail(String email) async {
    _email = email;
    return _authRemote.checkEmail(_email!);
  }

  Future<void> logIn(String password) async {
    _authRemote.logIn(_email!, password);
  }
}
