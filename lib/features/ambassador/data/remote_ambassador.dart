import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_ambassador.freezed.dart';
part 'remote_ambassador.g.dart';

@freezed
class RemoteAmbassador with _$RemoteAmbassador{
  // ignore: non_constant_identifier_names
  const factory RemoteAmbassador(String name, int user_count) = _RemoteAmbassador;

  factory RemoteAmbassador.fromJson(Map<String, Object?> json) => _$RemoteAmbassadorFromJson(json);
}