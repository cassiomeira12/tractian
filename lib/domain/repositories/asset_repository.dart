import 'package:tractian/domain/domain.dart';

abstract class IAssetRepository {
  Future<List<AssetEntity>> call({required String companyId});
}
