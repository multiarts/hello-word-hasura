import 'package:hello_word/app/modules/home/components/categories_list/categories_list_controller.dart';
import 'package:dio/dio.dart';
import 'package:hello_word/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_word/app/modules/home/home_page.dart';
import 'package:hello_word/app/modules/products/detail/detail_page.dart';
import 'package:hello_word/app/shared/repositories/products_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CategoriesListController()),
        Bind((i) => HomeController(i.get<ProductsRepository>())),
        Bind((i) => ProductsRepository(i.get<Dio>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router(
          '/productsdetail',
          child: (_, args) => DetailPage(items: args.data),
          transition: TransitionType.leftToRightWithFade,
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
