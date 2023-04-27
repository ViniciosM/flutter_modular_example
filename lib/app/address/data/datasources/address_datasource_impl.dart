import 'package:flutter_modular_example/app/address/data/datasources/address_datasource.dart';
import 'package:flutter_modular_example/app/address/data/models/address_model.dart';
import 'package:http/http.dart' as http;

class AddressDatasourceImpl implements AddressDatasource {
  @override
  Future<AddressModel> call({required String cep}) async {
    try {
      var url = Uri.https('https://viacep.com.br/ws/$cep/json/');
      var response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception('CEP inválido');
      }
      return AddressModel.fromJson(response.headers);
    } catch (e) {
      throw Exception('Erro ao buscar endereço');
    }
  }
}
