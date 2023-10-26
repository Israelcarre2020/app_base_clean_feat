import 'package:app_1_clean/features/feat_one/data/models/request_data_model.dart';

import '../models/fetch_data_test_model.dart';

abstract class FeatOneDatasource {
  Future<FetchDataTestModel> getFeatOne(
      {required RequestDataModel requestBody});
}
