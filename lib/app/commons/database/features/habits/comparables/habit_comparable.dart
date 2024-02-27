import 'package:drift/drift.dart';
import 'package:own_quest_app/app/commons/database/database.dart';
import 'package:own_quest_app/app/commons/database/external/drift_comparable.dart';
import 'package:own_quest_app/app/packages/login/domain/model/habit_model.dart';

class HabitComparable implements DriftComparable<Habit, String, $HabitTableTable> {
  const HabitComparable();

  @override
  Expression<bool> withEntity(Habit model, $HabitTableTable entity) {
    return entity.title.equals(model.title);
  }

  @override
  Expression<bool> withId(String title, $HabitTableTable entity) {
    return entity.title.equals(title);
  }
}