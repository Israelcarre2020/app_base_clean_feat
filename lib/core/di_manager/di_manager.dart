import 'package:app_1_clean/core/network/di/network_injector.dart';
import 'package:app_1_clean/features/feat_one/di/feat_one_injector.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> injectionDependencies() async {
  getIt.pushNewScope();

  await NetworkInjector().inject();
  await FeatOneInjector.inject();
}
