import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_ambassador.freezed.dart';
part 'remote_ambassador.g.dart';

@freezed
class RemoteAmbassador with _$RemoteAmbassador{
  const factory RemoteAmbassador(String name, String user_count) = _RemoteAmbassador;

  factory RemoteAmbassador.fromJson(Map<String, Object?> json) => _$RemoteAmbassadorFromJson(json);
}