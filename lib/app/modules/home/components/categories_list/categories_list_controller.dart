import 'package:mobx/mobx.dart';

part 'categories_list_controller.g.dart';

class CategoriesListController = _CategoriesListBase
    with _$CategoriesListController;

abstract class _CategoriesListBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
