import 'package:mobx/mobx.dart';

part 'index_controller.g.dart';

class IndexController = _IndexBase with _$IndexController;

abstract class _IndexBase with Store {
  @observable
  int selectedIndex = 1;

  @action
  void changeIndex(int index) {
    selectedIndex = index;
    print(index);
  }
}
