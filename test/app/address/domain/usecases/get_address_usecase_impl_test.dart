import 'package:flutter_modular_example/app/address/domain/entities/address_entity.dart';
import 'package:flutter_modular_example/app/address/domain/repositories/address_repository.dart';
import 'package:flutter_modular_example/app/address/domain/usecases/get_address_usecase.dart';
import 'package:flutter_modular_example/app/address/domain/usecases/get_address_usecase_impl.dart';
import 'package:flutter_modular_example/core/shared/base_error.dart';
import 'package:flutter_modular_example/core/shared/result_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AddressRepositoryMock extends Mock implements AddressRepository {}

void main() {
  late AddressRepository addressRepository;
  late GetAddressUsecase getAddressUsecase;
  late AddressEntity addressMock;

  setUpAll(() {
    addressRepository = AddressRepositoryMock();
    getAddressUsecase =
        GetAddressUsecaseImpl(addressRepository: addressRepository);
    addressMock = const AddressEntity(
        cep: '123456',
        logradouro: 'logradouro',
        bairro: 'bairro',
        complemento: 'complemento',
        localidade: 'localidade',
        uf: 'uf');
  });

  group('[DOMAIN] - GetAddressUsecase', () {
    test('Should be invalid when cep have less than 8 characters', () async {
      // Given
      String cep = '1234567';

      // When
      final result = await getAddressUsecase.call(cep: cep);

      // Then
      expect(result.isError, true);
      expect(result.getErrorData.message, 'CEP inválido');
    });
  });

  test('CEP is valid, but repository return a error', () async {
    // Given
    String cep = '12345678';

    // When
    when(() => addressRepository.getAddress(cep: cep))
        .thenAnswer((_) async => ResultError(BaseError('CEP não encontrado')));

    final result = await getAddressUsecase(cep: cep);

    // Then
    expect(result.isError, true);
    expect(result.getErrorData.message, 'CEP não encontrado');
  });

  test('Should return a valid cep', () async {
    // Given
    String cep = '12345678';

    // When
    when(
      () => addressRepository.getAddress(cep: cep),
    ).thenAnswer((_) async => ResultSuccess(addressMock));

    final result = await addressRepository.getAddress(cep: cep);

    // Then
    expect(result.isSuccess, true);
    expect(result.getSuccessData, addressMock);
  });
}
