import 'package:app_1_clean/core/network/proxy/http_proxy_impl.dart';
import 'package:app_1_clean/features/feat_one/data/models/fetch_data_test_model.dart';

import 'package:app_1_clean/features/feat_one/data/models/request_data_model.dart';

import 'feat_one_datasource.dart';

class FeatOneDatasourceImpl implements FeatOneDatasource {
  final ApiClient apiClient;

  FeatOneDatasourceImpl({required this.apiClient});

  @override
  Future<FetchDataTestModel> getFeatOne(
      {required RequestDataModel requestBody}) async {
    final response = await apiClient.instance().get('/users/${requestBody.id}');

    return FetchDataTestModel.fromJson(response.data!);
  }
}
