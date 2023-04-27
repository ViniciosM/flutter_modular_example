import 'package:flutter_modular_example/app/address/domain/entities/address_entity.dart';

import '../../../../core/shared/result_wrapper.dart';

abstract class GetAddressUsecase {
  Future<Result<AddressEntity>> call({required String cep});
}
