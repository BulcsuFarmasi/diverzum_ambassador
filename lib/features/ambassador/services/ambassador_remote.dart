import 'dart:convert';

import 'package:diverzum_ambassador/features/ambassador/data/ambassador_response.dart';
import 'package:diverzum_ambassador/shared/http/network_excpetion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final Provider<AmbassadorRemote> ambassadorRemoteProvider = Provider<AmbassadorRemote>((Ref ref) => AmbassadorRemote());

class AmbassadorRemote {
  Future<AmbassadorResponse> getAmbassador(String token) async {
    final http.Response response = await http
        .get(Uri.parse('https://api.diverzum.hu/api/auth/ambassador'), headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      return AmbassadorResponse.fromJson(json.decode(response.body));
    } else {
      throw NetworkException();
    }
  }
}
