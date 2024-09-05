import 'package:tractian/data/data.dart';
import 'package:tractian/domain/domain.dart';

class CompanyRepository implements ICompanyRepository {
  final ICompanyDataSource _dataSource;

  CompanyRepository({
    required ICompanyDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<List<CompanyModel>> call() {
    return _dataSource.call();
  }
}
