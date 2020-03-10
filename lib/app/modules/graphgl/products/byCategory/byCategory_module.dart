import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_word/app/modules/graphgl/products/byCategory/byCategory_page.dart';

class ByCategoryModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Bind((i) => ByCategoryController()),
      ];

  @override
  List<Router> get routers => [
        Router('/bycategory', child: (_, args) => ByCategoryPage(code: args.data)),
      ];

  static Inject get to => Inject<ByCategoryModule>.of();
}
