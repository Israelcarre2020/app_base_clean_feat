import 'package:app_1_clean/features/feat_one/domain/entities/data_test_entity.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final DataTestEntity dataTestEntity;

  const Page2({required this.dataTestEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
    );
  }
}
