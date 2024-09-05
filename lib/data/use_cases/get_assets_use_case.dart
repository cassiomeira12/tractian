import 'package:tractian/domain/domain.dart';

class GetAssetsUseCase implements IGetAssetsUseCase {
  final IAssetRepository _repository;

  GetAssetsUseCase({
    required IAssetRepository repository,
  }) : _repository = repository;

  @override
  Future<List<AssetEntity>> call({required String companyId}) {
    return _repository.call(companyId: companyId);
  }
}
