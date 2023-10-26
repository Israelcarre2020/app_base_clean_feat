import '../entities/data_test_entity.dart';
import '../entities/request_data_entity.dart';

abstract class FeatOneRepository {
  Future<DataTestEntity> getFeatOne({required RequestDataEntity requestBody});
}
