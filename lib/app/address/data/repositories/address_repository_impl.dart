import 'package:flutter_modular_example/app/address/data/datasources/address_datasource.dart';
import 'package:flutter_modular_example/app/address/data/datasources/address_datasource_impl.dart';
import 'package:flutter_modular_example/core/shared/result_wrapper.dart';

import 'package:flutter_modular_example/app/address/domain/entities/address_entity.dart';

import '../../../../core/shared/base_error.dart';
import '../../domain/repositories/address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressDatasourceImpl addressDatasource;

  AddressRepositoryImpl({required this.addressDatasource});

  @override
  Future<Result<AddressEntity>> getAddress({required String cep}) async {
    try {
      final result = await addressDatasource.call(cep: cep);
      return ResultSuccess(result);
    } catch (e) {
      return ResultError(BaseError(e.toString()));
    }
  }
}
