// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IndexController on _IndexBase, Store {
  final _$selectedIndexAtom = Atom(name: '_IndexBase.selectedIndex');

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

  final _$_IndexBaseActionController = ActionController(name: '_IndexBase');

  @override
  void changeIndex(int index) {
    final _$actionInfo = _$_IndexBaseActionController.startAction();
    try {
      return super.changeIndex(index);
    } finally {
      _$_IndexBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFavorite(int id) {
    final _$actionInfo = _$_IndexBaseActionController.startAction();
    try {
      return super.toggleFavorite(id);
    } finally {
      _$_IndexBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'selectedIndex: ${selectedIndex.toString()}';
    return '{$string}';
  }
}
