import 'package:flutter/material.dart';
import 'package:own_quest_app/app/commons/xdebugging/core/data/models/debugging_model.dart';
import 'package:own_quest_app/app/commons/xdebugging/core/data/repository/shared_preferences_repository.dart';
import 'package:own_quest_app/app/commons/xdebugging/features/network/data/models/api_response.dart';
import 'package:own_quest_app/app/commons/xdebugging/features/network/di/network_module.dart';
import 'package:own_quest_app/app/commons/xdebugging/features/network/presentation/widgets/network_request_tile.dart';
import 'package:own_quest_app/app/commons/xdebugging/presentation/state/screen_result.dart';

class NetworkRequestsPage extends StatefulWidget {
  const NetworkRequestsPage({super.key});

  @override
  State<NetworkRequestsPage> createState() => _NetworkRequestsPageState();
}

class _NetworkRequestsPageState extends State<NetworkRequestsPage> {
  ScreenResult<List<DebuggingModel>> _result = const ScreenResult();
  final SharedPreferencesRepository _repository = NetworkModule().repository;

  @override
  void initState() {
    super.initState();
    _asyncInit();
  }

  Future<void> _asyncInit() async {
    try {
      final data = await _repository.findAll();

      setState(() {
        _result = _result.copyWith(
          newResult: data,
          newStatus: ScreenStatus.success,
        );
      });
    } catch (e) {
      setState(() {
        _result = _result.copyWith(
          newStatus: ScreenStatus.error,
        );
      });
    }
  }

  Future<void> deleteAndReload() async {
    await _repository.deleteAll();
    await _asyncInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: deleteAndReload,
        child: const Icon(Icons.delete),
      ),
      body: Stack(
        children: [
          if (_result.status == ScreenStatus.loading) ...{
            const Center(child: CircularProgressIndicator()),
          } else if (_result.status == ScreenStatus.error) ...{
            const Center(child: Text('Error')),
          } else if (_result.status == ScreenStatus.success) ...{
            CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only(top: 10),
                  sliver: SliverList.separated(
                    itemBuilder: (_, index) {
                      final apiResponse = _result.result![index] as ApiResponse;
                      return NetworkRequestTile(apiResponse: apiResponse);
                    },
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: _result.result?.length ?? 0,
                  ),
                ),
              ],
            ),
          },
        ],
      ),
    );
  }
}
