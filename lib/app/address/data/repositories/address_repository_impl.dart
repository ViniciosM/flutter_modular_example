import 'package:flutter_modular_example/core/shared/result_wrapper.dart';

import 'package:flutter_modular_example/app/address/domain/entities/address_entity.dart';

import '../../domain/repositories/address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  @override
  Future<Result<AddressEntity>> getAddress({required String cep}) {
    // TODO: implement getAddress
    throw UnimplementedError();
  }
}
