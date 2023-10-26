import 'package:app_1_clean/core/network/proxy/http_proxy_impl.dart';
import 'package:app_1_clean/features/feat_one/data/datasource/feat_one_datasource_impl.dart';
import 'package:app_1_clean/features/feat_one/data/models/fetch_data_test_model.dart';
import 'package:app_1_clean/features/feat_one/data/models/request_data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'feat_one_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiClient, Dio])
void main() {
  group('IzipayRemoteDataSource', () {
    late FeatOneDatasourceImpl dataSource;
    late MockApiClient mockApiClient;
    late MockDio mockDio;

    setUp(() {
      mockApiClient = MockApiClient();
      dataSource = FeatOneDatasourceImpl(apiClient: mockApiClient);
      mockDio = MockDio();
    });

    test('should return a list of CashinCards when the request is successful',
        () async {
      final mockResponse = {
        'id': 1,
        'username': 'Leanne Graham',
        'email': 'Bret',
      };

      final requestMock = RequestDataModel(id: '1', userId: '1');

      when(mockApiClient.instance()).thenReturn(mockDio);
      when(mockDio.get(any)).thenAnswer((_) async => Response(
          data: mockResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: '')));

      final result = await dataSource.getFeatOne(requestBody: requestMock);

      expect(result, isA<FetchDataTestModel>());
    });

    test('should DioException when the request is fail', () async {
      final requestMock = RequestDataModel(id: '1', userId: '1');
      when(mockApiClient.instance()).thenReturn(mockDio);

      when(mockDio.get(any,
              options: anyNamed('options'),
              queryParameters: anyNamed('queryParameters')))
          .thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'No autorizado',
      ));

      try {
        await dataSource.getFeatOne(requestBody: requestMock);
      } catch (e) {
        expect(
          e,
          isA<DioException>(),
        );
      }
    });
  });
}
