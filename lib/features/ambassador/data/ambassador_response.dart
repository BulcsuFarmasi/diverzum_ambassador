import 'package:diverzum_ambassador/features/ambassador/data/remote_ambassador.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ambassador_response.freezed.dart';
part 'ambassador_response.g.dart';

@freezed
class AmbassadorResponse  with _$AmbassadorResponse {
  const factory AmbassadorResponse(List<RemoteAmbassador> leaderboard) = _AmbassadorResponse;

  factory AmbassadorResponse.fromJson(Map<String, Object?> json) => _$AmbassadorResponseFromJson(json);
}