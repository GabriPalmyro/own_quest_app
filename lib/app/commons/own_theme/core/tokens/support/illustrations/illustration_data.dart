import 'package:own_quest_app/app/commons/own_theme/core/tokens/support/asset_data.dart';

class IllustrationAssetData extends AssetData<String> {
  const IllustrationAssetData({
    required super.identifier,
    required super.extensionType,
  });

  String path() {
    return 'assets/images/$identifier.$extensionType';
  }
}
