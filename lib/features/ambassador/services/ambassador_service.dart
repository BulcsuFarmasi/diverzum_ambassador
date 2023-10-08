import 'package:diverzum_ambassador/features/ambassador/data/ambassador_response.dart';
import 'package:diverzum_ambassador/features/ambassador/services/ambassador_remote.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<AmbassadorService> ambassadorServiceProvider =
    Provider<AmbassadorService>((Ref ref) => AmbassadorService(ref.read(ambassadorRemoteProvider)));

class AmbassadorService {
  AmbassadorService(this._ambassadorRemote);

  final AmbassadorRemote _ambassadorRemote;

  Future<AmbassadorResponse> getAmbassador(String token) {
    return _ambassadorRemote.getAmbassador(token);
  }
}
