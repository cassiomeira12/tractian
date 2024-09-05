import 'package:tractian/data/data.dart';
import 'package:tractian/infra/infra.dart';

class AssetDataSource implements IAssetDataSource {
  final Http _http;

  AssetDataSource({
    required Http http,
  }) : _http = http;

  @override
  Future<List<AssetModel>> call({required String companyId}) async {
    try {
      final request = HttpRequest(
        url: '/companies/$companyId/assets',
      );

      final response = await _http.get(request);

      if (response.isSuccess()) {
        List data = response.data ?? [];
        return List.from(data).map((json) {
          return AssetModel.fromJson(json);
        }).toList();
      }

      throw Exception();
    } on HttpException catch (_) {
      rethrow;
    }
  }
}
