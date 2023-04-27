import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/splash/splash_page.dart';
import '../address/address_module.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: ((context, args) => const SplashPage())),
    RedirectRoute('/redirect', to: '/'),
    ModuleRoute('/address', module: AddressModule()),
  ];
}
