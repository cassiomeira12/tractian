import 'package:tractian/data/data.dart';

abstract class IAssetDataSource {
  Future<List<AssetModel>> call({required String companyId});
}
