import 'package:tractian/domain/domain.dart';

class GetCompaniesUseCase implements IGetCompaniesUseCase {
  final ICompanyRepository _repository;

  GetCompaniesUseCase({
    required ICompanyRepository repository,
  }) : _repository = repository;

  @override
  Future<List<CompanyEntity>> call() async {
    return _repository.call();
  }
}
