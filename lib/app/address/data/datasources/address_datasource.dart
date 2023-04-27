import '../models/address_model.dart';

abstract class AddressDatasource {
  Future<AddressModel> call({required String cep});
}
