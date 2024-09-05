import 'package:tractian/domain/domain.dart';

abstract class ILocationRepository {
  Future<List<AssetEntity>> call({required String companyId});
}
