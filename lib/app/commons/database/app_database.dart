import 'dart:async';

import 'package:drift/drift.dart';

abstract class LocalDataSource<T, ID> {
  FutureOr<List<T>> listAll();
  FutureOr<T?> findById();
  FutureOr<void> save(T model);
  FutureOr<void> delete(T model);
}

class DriftDataSouce<T, ID, B extends Insertable<B>, C extends Table> extends LocalDataSource<T, ID> {
  DriftDataSouce(
    this._db,
    this._table, {
    InsertMode insertMode = InsertMode.insertOrReplace,
  }) : _insertMode = insertMode;
  final GeneratedDatabase _db;
  final TableInfo _table;
  final InsertMode _insertMode;

  @override
  FutureOr<void> delete(T model) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  FutureOr<T?> findById() {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  FutureOr<List<T>> listAll() {
    // TODO: implement listAll
    throw UnimplementedError();
  }

  @override
  FutureOr<void> save(T model) {
    try {
      return _db
          .into(_table)
          .insert(
            model as B,
            mode: _insertMode,
          )
          .then((value) => Future.value());
    } catch (e) {
      return Future.error(e);
    }
  }
}
