import 'package:tractian/data/data.dart';

abstract class ICompanyDataSource {
  Future<List<CompanyModel>> call();
}
