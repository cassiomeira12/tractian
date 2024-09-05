import 'package:tractian/data/data.dart';
import 'package:tractian/infra/infra.dart';

class LocationDataSource implements ILocationDataSource {
  final Http _http;

  LocationDataSource({
    required Http http,
  }) : _http = http;

  @override
  Future<List<AssetModel>> call({required String companyId}) async {
    try {
      final request = HttpRequest(
        url: '/companies/$companyId/locations',
      );

      final response = await _http.get(request);

      if (response.isSuccess()) {
        List data = response.data ?? [];
        return List.from(data).map((json) {
          json['isLocation'] = true;
          return AssetModel.fromJson(json);
        }).toList();
      }

      throw Exception();
    } catch (error) {
      rethrow;
    }
  }
}
