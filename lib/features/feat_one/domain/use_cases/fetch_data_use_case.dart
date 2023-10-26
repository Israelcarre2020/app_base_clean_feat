import 'package:app_1_clean/core/generic_use_case/generic_use_case.dart';
import 'package:app_1_clean/features/feat_one/domain/entities/data_test_entity.dart';

import '../entities/request_data_entity.dart';
import '../repository/feat_one_repository.dart';

class FetchDataUseCase
    implements UseCase<Future<DataTestEntity>, RequestDataEntity> {
  final FeatOneRepository repository;

  FetchDataUseCase({required this.repository});

  @override
  Future<DataTestEntity> call(RequestDataEntity params) async {
    return repository.getFeatOne(requestBody: params);
  }
}
