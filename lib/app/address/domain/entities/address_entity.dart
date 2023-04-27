class AddressEntity {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;

  AddressEntity({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });
}
