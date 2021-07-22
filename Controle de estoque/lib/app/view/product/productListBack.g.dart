// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'productListBack.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductListBack on _ProductListBack, Store {
  final _$listAtom = Atom(name: '_ProductListBack.list');

  @override
  Future<List<Product>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Product>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_ProductListBackActionController =
      ActionController(name: '_ProductListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_ProductListBackActionController.startAction(
        name: '_ProductListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_ProductListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
