import 'package:app_1_clean/core/di_manager/di_manager.dart';
import 'package:app_1_clean/core/network/proxy/http_proxy_impl.dart';

import '../../di_manager/inject_interface.dart';

class NetworkInjector implements InjectInterface {
  @override
  Future<void> inject() async {
    getIt.registerLazySingleton(() => ApiClient());
  }
}
