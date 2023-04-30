import 'package:dio/dio.dart';
import 'package:flutter_modular_example/app/address/data/datasources/address_datasource.dart';
import 'package:flutter_modular_example/app/address/data/models/address_model.dart';

class AddressDatasourceImpl implements AddressDatasource {
  final Dio dio;

  AddressDatasourceImpl(this.dio);

  @override
  Future<AddressModel> call({required String cep}) async {
    try {
      // var response = await http.get(
      //   Uri.http('https://viacep.com.br/ws/$cep/json/'),
      // );

      // if (response.statusCode != 200) {
      //   throw Exception('CEP inválido');
      // }

      // var json = jsonDecode(response.body);
      // return AddressModel.fromJson(json);

      var response = await dio.get('https://viacep.com.br/ws/$cep/json/');
      if (response.data.containsKey('erro')) {
        throw Exception('CEP inválido');
      }
      return AddressModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Erro ao buscar endereço');
    }
  }
}
