import 'package:diverzum_ambassador/features/auth/data/auth_handler_response_body.dart';
import 'package:diverzum_ambassador/features/auth/data/login_response_body.dart';
import 'package:diverzum_ambassador/features/auth/services/auth_remote.dart';
import 'package:diverzum_ambassador/shared/http/network_excpetion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<AuthService> authServiceProvider =
    Provider<AuthService>((Ref ref) => AuthService(ref.read(authRemoteProvider)));

class AuthService {
  final AuthRemote _authRemote;
  String? _email;
  String? _token;

  String? get token => _token;

  AuthService(this._authRemote);

  Future<AuthHandlerResponseBody> checkEmail(String email) async {
    try {
      _email = email;
      return _authRemote.checkEmail(_email!);
    } on NetworkException {
      rethrow;
    }
  }

  Future<LoginResponseBody> login(String password) async {
    try {
      LoginResponseBody loginResponseBody = await _authRemote.login(_email!, password);
      _token = loginResponseBody.access_token;
      return loginResponseBody;
    } on NetworkException {
      rethrow;
    }
  }
}
