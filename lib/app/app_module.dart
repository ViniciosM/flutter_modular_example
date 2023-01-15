import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
      ];
}
