import 'package:app_1_clean/features/feat_one/domain/entities/data_test_entity.dart';
import 'package:app_1_clean/features/feat_one/domain/entities/request_data_entity.dart';
import 'package:app_1_clean/features/feat_one/domain/use_cases/fetch_data_use_case.dart';
import 'package:app_1_clean/features/feat_one/presentation/bloc/feat_one_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'feat_one_bloc_test.mocks.dart';

@GenerateMocks([FetchDataUseCase])
void main() {
  group('FeatOneBloc tests', () {
    late FeatOneBloc bloc;
    late MockFetchDataUseCase mockFetchDataUseCase;

    setUp(() {
      mockFetchDataUseCase = MockFetchDataUseCase();
      bloc = FeatOneBloc(fetchDataUseCase: mockFetchDataUseCase);
    });

    tearDown(() {
      bloc.close();
    });

    test('emits Loading and Loaded when fetchDataUseCase succeeds', () async {
      final requestData = RequestDataEntity(id: '1', userId: '1');
      final expectedData =
          DataTestEntity(id: 1, userName: 'Leanne Graham', email: 'Bret');

      when(mockFetchDataUseCase.call(requestData))
          .thenAnswer((_) async => expectedData);

      bloc.add(FeatOneEvent.eventOne(params: requestData));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const FeatOneState.loading(),
          FeatOneState.loaded(expectedData),
        ]),
      );

      verify(mockFetchDataUseCase.call(requestData)).called(1);
    });

    test(
        'emits Loading and Error when fetchDataUseCase fails with DioException',
        () async {
      final requestData = RequestDataEntity(id: '1', userId: '1');
      final dioException = DioException(
          error: 'Failed to get data',
          requestOptions: RequestOptions(path: ''));

      when(mockFetchDataUseCase.call(requestData)).thenThrow(dioException);

      bloc.add(FeatOneEvent.eventOne(params: requestData));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const FeatOneState.loading(),
          const FeatOneState.error('Failed to get data'),
        ]),
      );

      verify(mockFetchDataUseCase.call(requestData)).called(1);
    });

    test(
        'emits Loading and Error when fetchDataUseCase fails with unknown error',
        () async {
      final requestData = RequestDataEntity(id: '1', userId: '1');

      when(mockFetchDataUseCase.call(requestData))
          .thenThrow(Exception('Unknown Error, sorry :('));

      bloc.add(FeatOneEvent.eventOne(params: requestData));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const FeatOneState.loading(),
          const FeatOneState.error('Unknown Error, sorry :('),
        ]),
      );

      verify(mockFetchDataUseCase.call(requestData)).called(1);
    });
  });
}
