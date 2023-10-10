import 'package:diverzum_ambassador/features/ambassador/data/remote_ambassador.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ambassador_response_body.freezed.dart';
part 'ambassador_response_body.g.dart';

@freezed
class AmbassadorResponseBody  with _$AmbassadorResponseBody {
  const factory AmbassadorResponseBody(List<RemoteAmbassador> leaderboard) = _AmbassadorResponse;

  factory AmbassadorResponseBody.fromJson(Map<String, Object?> json) => _$AmbassadorResponseBodyFromJson(json);
}