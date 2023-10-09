import 'package:freezed_annotation/freezed_annotation.dart';

part 'ambassador.freezed.dart';

part 'ambassador.g.dart';

@freezed
class Ambassador with _$Ambassador {
  const factory Ambassador(int position, String name, int userCount, {String? badgeImage}) = _Ambassador;

  factory Ambassador.fromJson(Map<String, Object?> json) => _$AmbassadorFromJson(json);
}
