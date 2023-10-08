import 'package:freezed_annotation/freezed_annotation.dart';

part 'ambassador_response.freezed.dart';
part 'ambassador_response.g.dart';

@freezed
class AmbassadorResponse  with _$AmbassadorResponse {
  const factory AmbassadorResponse() = _AmbassadorResponse;

  factory AmbassadorResponse.fromJson(Map<String, Object?> json) => _$AmbassadorResponseFromJson(json);
}