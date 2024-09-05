import 'package:tractian/domain/domain.dart';

abstract class IGetAssetsUseCase {
  Future<List<AssetEntity>> call({required String companyId});
}
