import 'package:tractian/domain/domain.dart';

class GetLocationsUseCase implements IGetLocationsUseCase {
  final ILocationRepository _repository;

  GetLocationsUseCase({
    required ILocationRepository repository,
  }) : _repository = repository;

  @override
  Future<List<AssetEntity>> call({required String companyId}) {
    return _repository.call(companyId: companyId);
  }
}
