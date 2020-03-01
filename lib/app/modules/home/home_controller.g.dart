// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  Computed<String> _$totalCartReadComputed;

  @override
  String get totalCartRead =>
      (_$totalCartReadComputed ??= Computed<String>(() => super.totalCartRead))
          .value;

  final _$productsAtom = Atom(name: '_HomeBase.products');

  @override
  ObservableFuture<List<ProductsModel>> get products {
    _$productsAtom.context.enforceReadPolicy(_$productsAtom);
    _$productsAtom.reportObserved();
    return super.products;
  }

  @override
  set products(ObservableFuture<List<ProductsModel>> value) {
    _$productsAtom.context.conditionallyRunInAction(() {
      super.products = value;
      _$productsAtom.reportChanged();
    }, _$productsAtom, name: '${_$productsAtom.name}_set');
  }

  final _$prodListAtom = Atom(name: '_HomeBase.prodList');

  @override
  List<ProductsModel> get prodList {
    _$prodListAtom.context.enforceReadPolicy(_$prodListAtom);
    _$prodListAtom.reportObserved();
    return super.prodList;
  }

  @override
  set prodList(List<ProductsModel> value) {
    _$prodListAtom.context.conditionallyRunInAction(() {
      super.prodList = value;
      _$prodListAtom.reportChanged();
    }, _$prodListAtom, name: '${_$prodListAtom.name}_set');
  }

  final _$categoriesListAtom = Atom(name: '_HomeBase.categoriesList');

  @override
  List<CategoriesModel> get categoriesList {
    _$categoriesListAtom.context.enforceReadPolicy(_$categoriesListAtom);
    _$categoriesListAtom.reportObserved();
    return super.categoriesList;
  }

  @override
  set categoriesList(List<CategoriesModel> value) {
    _$categoriesListAtom.context.conditionallyRunInAction(() {
      super.categoriesList = value;
      _$categoriesListAtom.reportChanged();
    }, _$categoriesListAtom, name: '${_$categoriesListAtom.name}_set');
  }

  final _$selectedIndexAtom = Atom(name: '_HomeBase.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.context.enforceReadPolicy(_$selectedIndexAtom);
    _$selectedIndexAtom.reportObserved();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.context.conditionallyRunInAction(() {
      super.selectedIndex = value;
      _$selectedIndexAtom.reportChanged();
    }, _$selectedIndexAtom, name: '${_$selectedIndexAtom.name}_set');
  }

  final _$selectedAtom = Atom(name: '_HomeBase.selected');

  @override
  bool get selected {
    _$selectedAtom.context.enforceReadPolicy(_$selectedAtom);
    _$selectedAtom.reportObserved();
    return super.selected;
  }

  @override
  set selected(bool value) {
    _$selectedAtom.context.conditionallyRunInAction(() {
      super.selected = value;
      _$selectedAtom.reportChanged();
    }, _$selectedAtom, name: '${_$selectedAtom.name}_set');
  }

  final _$isfavoritedAtom = Atom(name: '_HomeBase.isfavorited');

  @override
  bool get isfavorited {
    _$isfavoritedAtom.context.enforceReadPolicy(_$isfavoritedAtom);
    _$isfavoritedAtom.reportObserved();
    return super.isfavorited;
  }

  @override
  set isfavorited(bool value) {
    _$isfavoritedAtom.context.conditionallyRunInAction(() {
      super.isfavorited = value;
      _$isfavoritedAtom.reportChanged();
    }, _$isfavoritedAtom, name: '${_$isfavoritedAtom.name}_set');
  }

  final _$totalCartAtom = Atom(name: '_HomeBase.totalCart');

  @override
  int get totalCart {
    _$totalCartAtom.context.enforceReadPolicy(_$totalCartAtom);
    _$totalCartAtom.reportObserved();
    return super.totalCart;
  }

  @override
  set totalCart(int value) {
    _$totalCartAtom.context.conditionallyRunInAction(() {
      super.totalCart = value;
      _$totalCartAtom.reportChanged();
    }, _$totalCartAtom, name: '${_$totalCartAtom.name}_set');
  }

  final _$qtyAtom = Atom(name: '_HomeBase.qty');

  @override
  int get qty {
    _$qtyAtom.context.enforceReadPolicy(_$qtyAtom);
    _$qtyAtom.reportObserved();
    return super.qty;
  }

  @override
  set qty(int value) {
    _$qtyAtom.context.conditionallyRunInAction(() {
      super.qty = value;
      _$qtyAtom.reportChanged();
    }, _$qtyAtom, name: '${_$qtyAtom.name}_set');
  }

  final _$filterAtom = Atom(name: '_HomeBase.filter');

  @override
  String get filter {
    _$filterAtom.context.enforceReadPolicy(_$filterAtom);
    _$filterAtom.reportObserved();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.context.conditionallyRunInAction(() {
      super.filter = value;
      _$filterAtom.reportChanged();
    }, _$filterAtom, name: '${_$filterAtom.name}_set');
  }

  final _$refreshAsyncAction = AsyncAction('refresh');

  @override
  Future<Null> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  final _$_HomeBaseActionController = ActionController(name: '_HomeBase');

  @override
  void changeIndex(int index) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.changeIndex(index);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getData() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.getData();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCategories() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.getCategories();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchProducts() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.fetchProducts();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(ProductsModel product) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.remove(product);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleFav() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.toggleFav();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAllFromCart(ProductsModel product) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.removeAllFromCart(product);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.decrement();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cartIncrement() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.cartIncrement();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cartDecrement() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.cartDecrement();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterList() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.filterList();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterGrid() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.filterGrid();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'products: ${products.toString()},prodList: ${prodList.toString()},categoriesList: ${categoriesList.toString()},selectedIndex: ${selectedIndex.toString()},selected: ${selected.toString()},isfavorited: ${isfavorited.toString()},totalCart: ${totalCart.toString()},qty: ${qty.toString()},filter: ${filter.toString()},totalCartRead: ${totalCartRead.toString()}';
    return '{$string}';
  }
}
