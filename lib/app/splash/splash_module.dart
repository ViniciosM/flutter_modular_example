import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/splash/splash_page.dart';

import '../category/category_module.dart';
import '../category/product/product_module.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: ((context, args) => const SplashPage())),
    RedirectRoute('/redirect', to: '/'),
    ModuleRoute('/category', module: CategoryModule()),
    ModuleRoute('/products', module: ProductModule()),
  ];
}
