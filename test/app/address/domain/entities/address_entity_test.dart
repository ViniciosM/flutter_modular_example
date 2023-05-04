import 'package:flutter_modular_example/app/address/domain/entities/address_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[DOMAIN] - AddressEntity', () {
    late AddressEntity addressEntity;

    setUpAll(() {
      addressEntity = const AddressEntity(
        cep: '1122334455',
        logradouro: 'logradouro',
        bairro: 'bairro',
        localidade: 'localidade',
        complemento: 'complemento',
        uf: 'uf',
      );
    });

    test('Should veriry correct content variables ', () {
      expect(addressEntity.cep, '1122334455');
      expect(addressEntity.logradouro, 'logradouro');
      expect(addressEntity.bairro, 'bairro');
      expect(addressEntity.localidade, 'localidade');
      expect(addressEntity.complemento, 'complemento');
      expect(addressEntity.uf, 'uf');
    });

    test('props', () {
      expect(addressEntity.props[0], '1122334455');
      expect(addressEntity.props[5], 'uf');
    });
  });
}
