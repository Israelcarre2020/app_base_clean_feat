part of 'feat_one_bloc.dart';

@freezed
class FeatOneState with _$FeatOneState {
  const factory FeatOneState.initial() = _Initial;
  const factory FeatOneState.loading() = _Loading;
  const factory FeatOneState.loaded(DataTestEntity resultData) = _Loaded;
  const factory FeatOneState.error(String message) = _Error;
}
