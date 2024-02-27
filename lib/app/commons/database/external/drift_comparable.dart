import 'package:drift/drift.dart';

abstract class DriftComparable<T, ID, C extends Table> {
  Expression<bool> withEntity(T model, C entity);
  Expression<bool> withId(ID id, C entity);
}