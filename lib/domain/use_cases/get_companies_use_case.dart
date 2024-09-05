import 'package:tractian/domain/domain.dart';

abstract class IGetCompaniesUseCase {
  Future<List<CompanyEntity>> call();
}
