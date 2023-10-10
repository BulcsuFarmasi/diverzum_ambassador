import 'dart:math';

import 'package:diverzum_ambassador/features/ambassador/data/ambassador.dart';
import 'package:diverzum_ambassador/features/ambassador/data/ambassador_response.dart';
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
    AmbassadorResponse ambassadorResponse = await _ambassadorService.getAmbassador(_authService.token!);
    _ambassadors = _convertAmbassadors(ambassadorResponse.leaderboard);
    pageCount = (_ambassadors.length / _ambassadorsPerPage).ceil();
    _ambassadorsRequested = true;
  }

  List<Ambassador> _convertAmbassadors(List<RemoteAmbassador> leaderboard) {
    List<Ambassador> ambassadors = [];
    const int badgeLimit = 3;
    for (final (index, remoteAmbassador) in leaderboard.indexed) {
      Ambassador ambassador = Ambassador(
        index + 1,
        remoteAmbassador.name,
        remoteAmbassador.user_count,
        badgeImage: (index < badgeLimit ? 'assets/images/badge_${index + 1}.png' : null),
      );
      ambassadors.add(ambassador);
    }

    return ambassadors;
  }
}
