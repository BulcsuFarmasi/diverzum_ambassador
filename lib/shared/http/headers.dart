import 'package:freezed_annotation/freezed_annotation.dart';

part 'headers.freezed.dart';
part 'headers.g.dart';

@freezed
class Headers with _${
  const factory Headers(String authorization) = _Headers;

  factory Headers.fromJson(Map<String, Object?> json) => _$HeadersFromJson(json);
}