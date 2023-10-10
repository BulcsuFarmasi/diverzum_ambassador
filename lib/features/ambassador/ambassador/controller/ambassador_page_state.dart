import 'package:diverzum_ambassador/features/ambassador/data/ambassador.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ambassador_page_state.freezed.dart';

@freezed
class AmbassadorPageState with _$AmbassadorPageState{
  const factory AmbassadorPageState.initial() = Initial;
  const factory AmbassadorPageState.pageLoadSuccess(List<Ambassador> ambassadors, int currentPage, int pageCount) = PageLoadSuccess;
  const factory AmbassadorPageState.pageLoadError() = PageLoadError;

}