import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/data_test_entity.dart';
import '../../domain/entities/request_data_entity.dart';
import '../../domain/use_cases/fetch_data_use_case.dart';

part 'feat_one_event.dart';
part 'feat_one_state.dart';
part 'feat_one_bloc.freezed.dart';

class FeatOneBloc extends Bloc<FeatOneEvent, FeatOneState> {
  final FetchDataUseCase fetchDataUseCase;

  FeatOneBloc({required this.fetchDataUseCase}) : super(const _Initial()) {
    on<_EventOne>((event, emit) async {
      await _fetchDataHandler(event: event, emit: emit);
    });
  }

  Future<void> _fetchDataHandler({
    required _EventOne event,
    required Emitter emit,
  }) async {
    emit(const FeatOneState.loading());

    try {
      final response = await fetchDataUseCase.call(event.params);

      emit(FeatOneState.loaded(response));
    } on DioException catch (e) {
      emit(FeatOneState.error(e.message ?? 'Failed to get data'));
    } catch (e) {
      emit(const FeatOneState.error('Unknown Error, sorry :('));
    }
  }
}
