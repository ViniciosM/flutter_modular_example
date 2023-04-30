import 'package:flutter_modular_example/app/address/domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  const AddressModel._({
    required String cep,
    String? logradouro,
    String? complemento,
    String? bairro,
    String? localidade,
    String? uf,
  }) : super(
          cep: cep,
          logradouro: logradouro,
          complemento: complemento,
          bairro: bairro,
          localidade: localidade,
          uf: uf,
        );

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel._(
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        uf: json["uf"],
      );

  Map<String, dynamic> toJson() => {
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
      };

  AddressModel copyWith({
    String? cep,
    String? logradouro,
    String? complemento,
    String? bairro,
    String? localidade,
    String? uf,
  }) =>
      AddressModel._(
        cep: cep ?? this.cep,
        logradouro: logradouro ?? this.logradouro,
        complemento: complemento ?? this.complemento,
        bairro: bairro ?? this.bairro,
        localidade: localidade ?? this.localidade,
        uf: uf ?? this.uf,
      );
}
