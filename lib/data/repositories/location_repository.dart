import 'package:tractian/data/data.dart';
import 'package:tractian/domain/domain.dart';

class LocationRepository implements ILocationRepository {
  final ILocationDataSource _dataSource;

  LocationRepository({
    required ILocationDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<List<AssetModel>> call({required String companyId}) {
    return _dataSource.call(companyId: companyId);
  }
}
