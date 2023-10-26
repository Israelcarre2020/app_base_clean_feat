import 'package:app_1_clean/features/feat_one/data/models/fetch_data_test_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:app_1_clean/features/feat_one/data/datasource/feat_one_datasource.dart';
import 'package:app_1_clean/features/feat_one/data/repository/feat_one_repository_impl.dart';
import 'package:app_1_clean/features/feat_one/domain/entities/data_test_entity.dart';
import 'package:app_1_clean/features/feat_one/domain/entities/request_data_entity.dart';

import 'feat_one_datasource_impl_test.mocks.dart';

@GenerateMocks([FeatOneDatasource])
void main() {
  late FeatOneRepositoryImpl repository;
  late MockFeatOneDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockFeatOneDatasource();
    repository = FeatOneRepositoryImpl(datasource: mockDatasource);
  });

  test('should return a DataTestEntity when the request is successful',
      () async {
    final requestMock = RequestDataEntity(id: '1', userId: '1');

    when(mockDatasource.getFeatOne(requestBody: anyNamed('requestBody')))
        .thenAnswer(
            (_) async => FetchDataTestModel(id: 1, email: '', userName: ''));

    final result = await repository.getFeatOne(requestBody: requestMock);

    expect(result, isA<DataTestEntity>());
  });

  test('should throw an exception when the request fails', () async {
    final requestMock = RequestDataEntity(id: '1', userId: '1');

    when(mockDatasource.getFeatOne(requestBody: anyNamed('requestBody')))
        .thenThrow(Exception('Request failed'));

    expect(
        () => repository.getFeatOne(requestBody: requestMock), throwsException);
  });
}
