import 'package:hello_word/app/modules/graphgl/index/index_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_word/app/modules/graphgl/index/index_page.dart';
import 'package:hello_word/app/modules/graphgl/products/byCategory/byCategory_page.dart';

class IndexModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => IndexController()),
      ];

  @override
  List<Router> get routers => [
        Router('/index', child: (_, args) => IndexPage()),
        Router('/bycategory',
          child: (_, args) => ByCategoryPage(code: args.data),
          transition: TransitionType.leftToRightWithFade,
        )
      ];

  static Inject get to => Inject<IndexModule>.of();
}
