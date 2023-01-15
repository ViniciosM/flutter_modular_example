import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/category/product/product_list_page.dart';

class ProductModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/:title',
          child: (context, args) => ProductListPage(
            product: args.params['title'],
          ),
        )
      ];
}
