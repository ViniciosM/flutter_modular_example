import 'package:flutter_modular_example/app/address/domain/entities/address_entity.dart';
import 'package:flutter_modular_example/app/address/domain/repositories/address_repository.dart';
import 'package:flutter_modular_example/app/address/domain/usecases/get_address_usecase.dart';
import 'package:flutter_modular_example/core/shared/result_wrapper.dart';

import '../../../../core/shared/base_error.dart';

class GetAddressUsecaseImpl implements GetAddressUsecase {
  final AddressRepository addressRepository;

  GetAddressUsecaseImpl({required this.addressRepository});

  @override
  Future<Result<AddressEntity>> call({required String cep}) async {
    if (cep.length != 8) {
      return ResultError(BaseError('CEP inválido'));
    }
    return await addressRepository.getAddress(cep: cep);
  }
}
