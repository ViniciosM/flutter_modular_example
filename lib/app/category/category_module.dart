import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/category/category_page.dart';
import 'package:flutter_modular_example/app/category/product/product_list_page.dart';
import 'package:flutter_modular_example/app/category/product/product_module.dart';

class CategoryModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: ((context, args) => const CategoryPage())),
        //ModuleRoute('/products', module: ProductModule())
      ];
}
