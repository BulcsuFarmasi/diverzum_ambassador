import 'dart:math';

import 'package:diverzum_ambassador/features/ambassador/data/ambassador.dart';
import 'package:diverzum_ambassador/features/ambassador/data/ambassador_response_body.dart';
import 'package:diverzum_ambassador/features/ambassador/data/remote_ambassador.dart';
import 'package:diverzum_ambassador/features/ambassador/services/ambassador_service.dart';
import 'package:diverzum_ambassador/features/auth/services/auth_service.dart';
import 'package:diverzum_ambassador/shared/http/network_excpetion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<AmbassadorRepository> ambadassorRepositoryProvider = Provider<AmbassadorRepository>(
  (Ref ref) => AmbassadorRepository(
    ref.read(ambassadorServiceProvider),
    ref.read(authServiceProvider),
  ),
);

class AmbassadorRepository {
  AmbassadorRepository(this._ambassadorService, this._authService);

  final AmbassadorService _ambassadorService;
  final AuthService _authService;

  List<Ambassador> _ambassadors = [];

  int? pageCount;

  bool _ambassadorsRequested = false;

  static const int _ambassadorsPerPage = 10;

  Future<List<Ambassador>> getAmbassadorPage(int page) async {
    if (!_ambassadorsRequested) {
      try {
        await _getAmbassadors();
      } on NetworkException {
        rethrow;
      }
    }

    final int pageStart = (page - 1) * 10;
    final int pageEnd = min(pageStart + _ambassadorsPerPage, _ambassadors.length);

    return _ambassadors.sublist(pageStart, pageEnd);
  }

  Future<void> _getAmbassadors() async {
    AmbassadorResponseBody ambassadorResponseBody = await _ambassadorService.getAmbassador(_authService.token!);
    _ambassadors = _convertAmbassadors(ambassadorResponseBody.leaderboard);
    pageCount = (_ambassadors.length / _ambassadorsPerPage).ceil();
    _ambassadorsRequested = true;
  }

  List<Ambassador> _convertAmbassadors(List<RemoteAmbassador> leaderboard) {
    List<Ambassador> ambassadors = [];
    const int badgeLimit = 3;
    for (final (index, remoteAmbassador) in leaderboard.indexed) {
      final int position = index + 1;
      Ambassador ambassador = Ambassador(
        position,
        remoteAmbassador.name,
        remoteAmbassador.user_count,
        badgeImage: (index < badgeLimit ? 'assets/images/badge_$position.png' : null),
      );
      ambassadors.add(ambassador);
    }

    return ambassadors;
  }
}
