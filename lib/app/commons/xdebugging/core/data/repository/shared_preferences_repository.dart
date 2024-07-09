import 'package:own_quest_app/app/commons/xdebugging/core/data/data_source/shared_preferences_data_source.dart';
import 'package:own_quest_app/app/commons/xdebugging/core/data/models/debugging_model.dart';
import 'package:own_quest_app/app/commons/xdebugging/features/network/domain/repository/local_repository.dart';

class SharedPreferencesRepository implements LocalRepository {
  SharedPreferencesRepository({
    required this.dataSource,
  });

  final SharedPreferencesDataSource dataSource;

  @override
  Future<void> save(DebuggingModel model) async {
    return dataSource.saveData(model);
  }

  @override
  Future<List<DebuggingModel>> findAll() async {
    return dataSource.findAll();
  }

  @override
  Future<void> deleteAll() async {
    return;
  }
}
