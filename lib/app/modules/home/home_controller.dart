import 'package:hello_word/app/shared/models/categories_model.dart';
import 'package:hello_word/app/shared/models/products_model.dart';
import 'package:hello_word/app/shared/repositories/products_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final ProductsRepository repository;

  _HomeBase(this.repository) {
    // fetchProducts();
    getData();
    getCategories();
    // isfavorited = false;
  }

  @observable
  ObservableFuture<List<ProductsModel>> products;

  @observable
  List<ProductsModel> prodList;
  
  @observable
  List<CategoriesModel> categoriesList;

  @observable
  int selectedIndex = 1;

  @action
  void changeIndex(int index) {
    selectedIndex = index;
  }

  @action
  getData(){
    repository.fetchPost().then((data) => prodList = data);
  }
  
  @action
  getCategories(){
    repository.fetchCategories().then((data) => categoriesList = data);
  }

  @action
  Future<Null> refresh() async {
    await getData();
    return null;
  }
  @observable
  bool selected = false;

  @observable
  bool isfavorited = false;

  @observable
  int totalCart = 0;

  @computed
  String get totalCartRead => totalCart.toString();

  @action
  fetchProducts() {
    products = repository.getAllProducts().asObservable();
  }

  @action
  void remove(ProductsModel product) {
    // print(products.value.removeAt(index));
    // print(products.value.contains(product.id));
    if (prodList.elementAt(product.id) == null) {
      print(product.id);      
    } else {
      print('Nada');
    }
  }

  @action
  toggleFav() {
    if (isfavorited) {
      return isfavorited = false;
    } else {
      return isfavorited = true;
    }
  }

  // @action
  // void changeQuantity(ProductsModel product, int quantity){
  //   int diference = quantity - getProductQuantity(product);
  //   while (diference != 0){
  //     if (diference > 0) {
  //       addToCart(product);
  //       diference--;
  //     } else if (diference < 0) {
  //       removeProduct(product);
  //       diference++;
  //     }
  //   }
  // }

  @action
  void removeAllFromCart(ProductsModel product) {
    prodList.removeWhere((p) => product == p);
  }

  @observable
  int qty = 1;

  @action
  void increment() {
    qty++;
  }

  @action
  void decrement() {
    qty--;
  }

  @action
  void cartIncrement() {
    totalCart++;
  }

  @action
  void cartDecrement() {
    totalCart--;
  }

  @observable
  String filter = 'list';

  @action
  void filterList() {
    filter = 'list';
  }
  
  @action
  void filterGrid() {
    filter = 'grid';
  }
}
