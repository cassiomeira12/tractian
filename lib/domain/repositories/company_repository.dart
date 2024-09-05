import 'package:tractian/domain/domain.dart';

abstract class ICompanyRepository {
  Future<List<CompanyEntity>> call();
}
