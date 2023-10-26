part of 'feat_one_bloc.dart';

@freezed
class FeatOneEvent with _$FeatOneEvent {
  const factory FeatOneEvent.eventOne({required RequestDataEntity params}) =
      _EventOne;
  const factory FeatOneEvent.eventTwo() = _EventTwo;
}
