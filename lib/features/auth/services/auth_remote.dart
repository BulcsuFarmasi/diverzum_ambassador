import 'dart:convert';

import 'package:diverzum_ambassador/features/auth/data/auth_handler_request.dart';
import 'package:diverzum_ambassador/features/auth/data/auth_handler_response.dart';
import 'package:diverzum_ambassador/features/auth/data/log_in_request.dart';
import 'package:diverzum_ambassador/features/auth/data/log_in_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final Provider<AuthRemote> authRemoteProvider = Provider<AuthRemote>((Ref ref) => AuthRemote());

class AuthRemote {
  static const url = 'https://api.diverzum.hu/api/auth';

  Future<AuthHandlerResponse> checkEmail(String email) async {
      final AuthHandlerRequest authHandlerRequest = AuthHandlerRequest(email);
      final http.Response response = await http.post(Uri.parse('$url/authHandler'), body: authHandlerRequest.toJson());

      return AuthHandlerResponse.fromJson(json.decode(response.body));
  }

  Future<LogInResponse> logIn(String email, String password) async {
    final LogInRequest logInRequest = LogInRequest(email, password);
    http.Response response = await http.post(Uri.parse('$url/login'), body: logInRequest.toJson());

    return LogInResponse.fromJson(json.decode(response.body));
  }
}