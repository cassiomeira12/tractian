import 'package:tractian/domain/domain.dart';

abstract class IGetLocationsUseCase {
  Future<List<AssetEntity>> call({required String companyId});
}
