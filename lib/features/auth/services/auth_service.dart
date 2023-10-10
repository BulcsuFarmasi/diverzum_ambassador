import 'package:diverzum_ambassador/features/auth/data/auth_handler_response.dart';
import 'package:diverzum_ambassador/features/auth/data/login_response.dart';
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

  Future<AuthHandlerResponse> checkEmail(String email) async {
    try {
      _email = email;
      return _authRemote.checkEmail(_email!);
    } on NetworkException {
      rethrow;
    }
  }

  Future<LoginResponse> login(String password) async {
    try {
      LoginResponse loginResponse = await _authRemote.login(_email!, password);
      _token = loginResponse.access_token;
      return loginResponse;
    } on NetworkException {
      rethrow;
    }
  }
}
