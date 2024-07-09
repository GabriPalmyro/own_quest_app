import 'package:own_quest_app/app/commons/xdebugging/core/data/models/debugging_model.dart';

abstract class LocalRepository {
  Future<void> save(DebuggingModel model);

  Future<List<DebuggingModel>> findAll();

  Future<void> deleteAll();
}
