// Mocks generated by Mockito 5.4.2 from annotations
// in app_1_clean/test/lib/features/feat_one/domain/use_cases/fetch_data_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:app_1_clean/features/feat_one/domain/entities/data_test_entity.dart'
    as _i2;
import 'package:app_1_clean/features/feat_one/domain/entities/request_data_entity.dart'
    as _i5;
import 'package:app_1_clean/features/feat_one/domain/repository/feat_one_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDataTestEntity_0 extends _i1.SmartFake
    implements _i2.DataTestEntity {
  _FakeDataTestEntity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FeatOneRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFeatOneRepository extends _i1.Mock implements _i3.FeatOneRepository {
  MockFeatOneRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.DataTestEntity> getFeatOne(
          {required _i5.RequestDataEntity? requestBody}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFeatOne,
          [],
          {#requestBody: requestBody},
        ),
        returnValue: _i4.Future<_i2.DataTestEntity>.value(_FakeDataTestEntity_0(
          this,
          Invocation.method(
            #getFeatOne,
            [],
            {#requestBody: requestBody},
          ),
        )),
      ) as _i4.Future<_i2.DataTestEntity>);
}
