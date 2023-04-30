import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/address/presentation/pages/address/controller/address_bloc.dart';
import 'package:flutter_modular_example/core/shared/base_state.dart';
import 'package:validatorless/validatorless.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

late TextEditingController _cepEC;
final _formKey = GlobalKey<FormState>();
final _addressBloc = Modular.get<AddressBloc>();

class _AddressPageState extends State<AddressPage> {
  @override
  void initState() {
    _cepEC = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _cepEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo[100],
        appBar: AppBar(
          title: const Text('Address Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                          controller: _cepEC,
                          decoration: InputDecoration(
                            label: const Text('CEP'),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.close_outlined),
                              onPressed: () {
                                _cepEC.clear();
                              },
                            ),
                          ),
                          validator: Validatorless.multiple([
                            Validatorless.required('Informe o CEP'),
                          ])),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        child: const Text('Consultar'),
                        onPressed: () async {
                          final formValid =
                              _formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            _addressBloc.getAddress(_cepEC.text);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                BlocBuilder<AddressBloc, BaseState>(
                    bloc: _addressBloc,
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is SuccessState) {
                        final address = state.data;
                        return Container(
                          color: Colors.indigo.shade300,
                          padding: const EdgeInsets.all(25),
                          margin: const EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text('Logradouro: ${address.logradouro}'),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('Complemento: ${address.complemento}'),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('Bairro: ${address.bairro}'),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('Localidade: ${address.localidade}'),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('UF: ${address.uf}'),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      }
                      if (state is ErrorState) {
                        return const Center(
                          child: Text('Ocorreu um erro inesperado'),
                        );
                      }
                      return const SizedBox.shrink();
                    }),
              ],
            ),
          ),
        ));
  }
}
