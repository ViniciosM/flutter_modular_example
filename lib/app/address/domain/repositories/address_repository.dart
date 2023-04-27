import 'package:flutter_modular_example/app/address/domain/entities/address_entity.dart';

import '../../../../core/shared/result_wrapper.dart';

abstract class AddressRepository {
  Future<Result<AddressEntity>> getAddress({required String cep});
}
