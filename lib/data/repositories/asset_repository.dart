import 'package:tractian/data/data.dart';
import 'package:tractian/domain/domain.dart';

class AssetRepository implements IAssetRepository {
  final IAssetDataSource _dataSource;

  AssetRepository({
    required IAssetDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<List<AssetModel>> call({required String companyId}) {
    return _dataSource.call(companyId: companyId);
  }
}
