import '../../domain/entities/data_test_entity.dart';
import '../../domain/entities/request_data_entity.dart';
import '../models/fetch_data_test_model.dart';
import '../models/request_data_model.dart';

extension RequestDataEntityToData on RequestDataEntity {
  toData() {
    return RequestDataModel(
      userId: userId,
      id: id,
    );
  }
}

extension FetchDataModelToDomain on FetchDataTestModel {
  toDomain() {
    return DataTestEntity(
      id: id,
      email: email,
      userName: userName,
    );
  }
}
