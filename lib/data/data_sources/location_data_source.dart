import 'package:tractian/data/data.dart';

abstract class ILocationDataSource {
  Future<List<AssetModel>> call({required String companyId});
}
