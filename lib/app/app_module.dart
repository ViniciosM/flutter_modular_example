import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/address/address_module.dart';
import 'package:flutter_modular_example/app/address/data/datasources/address_datasource.dart';
import 'package:flutter_modular_example/app/address/data/datasources/address_datasource_impl.dart';
import 'package:flutter_modular_example/app/address/data/repositories/address_repository_impl.dart';
import 'package:flutter_modular_example/app/address/domain/repositories/address_repository.dart';
import 'package:flutter_modular_example/app/address/domain/usecases/get_address_usecase.dart';
import 'package:flutter_modular_example/app/address/domain/usecases/get_address_usecase_impl.dart';
import 'package:flutter_modular_example/app/address/presentation/pages/address/controller/address_bloc.dart';
import 'package:flutter_modular_example/app/splash/splash_module.dart';
import 'package:http/http.dart' as http;

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // HTTP
        Bind.singleton((i) => http.Client()),

        // Dio
        Bind.singleton((i) => Dio()),

        // Datasources
        Bind.factory((i) => AddressDatasourceImpl(i())),

        // Repositories
        Bind.factory<AddressRepository>(
            (i) => AddressRepositoryImpl(addressDatasource: i())),

        // Usecases
        Bind.factory<GetAddressUsecase>(
            (i) => GetAddressUsecaseImpl(addressRepository: i())),

        // Blocs
        Bind.singleton<AddressBloc>((i) => AddressBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/address', module: AddressModule()),
      ];
}
