import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/address/presentation/pages/address/address_page.dart';

class AddressModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const AddressPage()),
      ];
}
