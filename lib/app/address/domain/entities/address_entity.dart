import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String cep;
  final String? logradouro;
  final String? complemento;
  final String? bairro;
  final String? localidade;
  final String? uf;

  const AddressEntity({
    required this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
  });

  @override
  List<Object?> get props =>
      [cep, logradouro, complemento, bairro, localidade, uf];
}
