import 'dart:convert';

import 'package:diverzum_ambassador/features/auth/data/auth_handler_request_body.dart';
import 'package:diverzum_ambassador/features/auth/data/auth_handler_response_body.dart';
import 'package:diverzum_ambassador/features/auth/data/login_request_body.dart';
import 'package:diverzum_ambassador/features/auth/data/login_response_body.dart';
import 'package:diverzum_ambassador/shared/http/network_excpetion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final Provider<AuthRemote> authRemoteProvider = Provider<AuthRemote>((Ref ref) => AuthRemote());

class AuthRemote {
  static const url = 'https://api.diverzum.hu/api/auth';

  Future<AuthHandlerResponseBody> checkEmail(String email) async {
    final AuthHandlerRequestBody authHandlerRequestBody = AuthHandlerRequestBody(email);
    final http.Response response = await http.post(Uri.parse('$url/authHandler'), body: authHandlerRequestBody.toJson());

    if (response.statusCode == 200) {
      return AuthHandlerResponseBody.fromJson(json.decode(response.body));
    } else {
      throw NetworkException();
    }
  }

  Future<LoginResponseBody> login(String email, String password) async {
    final LoginRequestBody loginRequestBody = LoginRequestBody(email, password);
    http.Response response = await http.post(Uri.parse('$url/login'), body: loginRequestBody.toJson());

    if (const [200, 401].contains(response.statusCode)) {
      return LoginResponseBody.fromJson(json.decode(response.body));
    } else {
      throw NetworkException();
    }


  }
}
