import 'package:drift/drift.dart';

class HabitTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 5, max: 64)();
  Column<DateTime> get createdAt => dateTime().withDefault(currentDateAndTime)();
}
