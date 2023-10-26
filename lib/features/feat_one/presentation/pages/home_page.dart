import 'package:app_1_clean/core/di_manager/di_manager.dart';
import 'package:app_1_clean/core/navigator/app_routes.dart';
import 'package:app_1_clean/features/feat_one/domain/entities/data_test_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/request_data_entity.dart';
import '../bloc/feat_one_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _featOneBloc = getIt<FeatOneBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _featOneBloc
          ..add(FeatOneEvent.eventOne(
              params: RequestDataEntity(id: '1', userId: ''))),
        child: BlocBuilder<FeatOneBloc, FeatOneState>(
          builder: (context, state) {
            return state.maybeWhen(
                error: (message) {
                  return Center(
                    child: Text(message),
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (data) {
                  return _body(data);
                },
                orElse: () => const Center(
                      child: Text('Unknown Error, sorry :('),
                    ));
          },
        ));
  }

  Widget _body(DataTestEntity data) => Scaffold(
        bottomNavigationBar: TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.page2, arguments: {
                  'dataTestEntity': data,
                }),
            child: const Text('Go to Page 2')),
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
      );
}
