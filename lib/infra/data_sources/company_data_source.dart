import 'package:tractian/data/data.dart';
import 'package:tractian/infra/infra.dart';

class CompanyDataSource implements ICompanyDataSource {
  final Http _http;

  CompanyDataSource({
    required Http http,
  }) : _http = http;

  @override
  Future<List<CompanyModel>> call() async {
    try {
      final request = HttpRequest(url: '/companies');

      final response = await _http.get(request);

      if (response.isSuccess()) {
        List data = response.data ?? [];
        return List.from(data).map((json) {
          return CompanyModel.fromJson(json);
        }).toList();
      }

      throw Exception();
    } catch (error) {
      rethrow;
    }
  }
}
