import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_word/app/modules/auth/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'index_controller.g.dart';

class IndexController = _IndexBase with _$IndexController;

abstract class _IndexBase with Store {
 
  ObservableList content = ObservableList();

  @observable
  int selectedIndex = 1;

  @action
  void changeIndex(int index) {
    selectedIndex = index;
    print(index);
  }

  @action
  void toggleFavorite(int id){
    var item = content.where((o) => o['id'] == id).first;

    item['status'] = !item['status'];

    print(item['status']);

    content.sort((a, b){
      if(a['id'] == b['id']){
        return 0;
      }
      return a['id'] > b['id'] ? 1 : 0;
    });
  }

  logoff() async {
    await Modular.get<AuthController>().logout();
    Modular.to.pushReplacementNamed('/auth');
  }
}
