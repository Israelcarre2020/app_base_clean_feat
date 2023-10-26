import 'package:app_1_clean/features/feat_one/domain/use_cases/fetch_data_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:app_1_clean/features/feat_one/domain/entities/data_test_entity.dart';
import 'package:app_1_clean/features/feat_one/domain/entities/request_data_entity.dart';
import 'package:app_1_clean/features/feat_one/domain/repository/feat_one_repository.dart';

import 'fetch_data_use_case_test.mocks.dart';

@GenerateMocks([FeatOneRepository])
void main() {
  late FetchDataUseCase useCase;
  late MockFeatOneRepository mockRepository;

  setUp(() {
    mockRepository = MockFeatOneRepository();
    useCase = FetchDataUseCase(repository: mockRepository);
  });

  test('should return a DataTestEntity when the request is successful',
      () async {
    final requestData = RequestDataEntity(id: '1', userId: '1');
    final expectedData =
        DataTestEntity(id: 1, userName: 'Leanne Graham', email: 'Bret');

    when(mockRepository.getFeatOne(requestBody: requestData))
        .thenAnswer((_) async => expectedData);

    final result = await useCase.call(requestData);
    expect(result, expectedData);
  });

  test('should throw an exception when the request fails', () async {
    final requestData = RequestDataEntity(id: '1', userId: '1');

    when(mockRepository.getFeatOne(requestBody: requestData))
        .thenThrow(Exception('Request failed'));

    expect(() => useCase.call(requestData), throwsException);
  });
}
