import 'package:app_1_clean/features/feat_one/data/mapper/feat_one_mappers.dart';
import 'package:app_1_clean/features/feat_one/domain/entities/data_test_entity.dart';

import 'package:app_1_clean/features/feat_one/domain/entities/request_data_entity.dart';

import '../../domain/repository/feat_one_repository.dart';
import '../datasource/feat_one_datasource.dart';

class FeatOneRepositoryImpl implements FeatOneRepository {
  final FeatOneDatasource datasource;

  FeatOneRepositoryImpl({required this.datasource});

  @override
  Future<DataTestEntity> getFeatOne(
      {required RequestDataEntity requestBody}) async {
    final response =
        await datasource.getFeatOne(requestBody: requestBody.toData());

    return response.toDomain();
  }
}
