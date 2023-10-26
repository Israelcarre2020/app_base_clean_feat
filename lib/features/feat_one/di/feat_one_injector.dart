import 'package:app_1_clean/core/di_manager/di_manager.dart';
import 'package:app_1_clean/features/feat_one/domain/use_cases/fetch_data_use_case.dart';
import 'package:app_1_clean/features/feat_one/presentation/bloc/feat_one_bloc.dart';

import '../data/datasource/feat_one_datasource.dart';
import '../data/datasource/feat_one_datasource_impl.dart';
import '../data/repository/feat_one_repository_impl.dart';
import '../domain/repository/feat_one_repository.dart';

class FeatOneInjector {
  static Future<void> inject() async {
    getIt.registerFactory(() => FeatOneBloc(
          fetchDataUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => FetchDataUseCase(repository: getIt()));

    getIt.registerLazySingleton<FeatOneRepository>(
        () => FeatOneRepositoryImpl(datasource: getIt()));

    getIt.registerLazySingleton<FeatOneDatasource>(
        () => FeatOneDatasourceImpl(apiClient: getIt()));
  }
}
