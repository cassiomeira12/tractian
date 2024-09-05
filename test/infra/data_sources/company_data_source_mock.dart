import 'package:tractian/data/data.dart';

class CompanyDataSourceMock implements ICompanyDataSource {
  final bool throwError;

  CompanyDataSourceMock({this.throwError = false});

  @override
  Future<List<CompanyModel>> call() async {
    List<Map<String, dynamic>> data = [
      {
        "id": "662fd0ee639069143a8fc387",
        "name": "Jaguar",
      },
      {
        "id": "662fd0fab3fd5656edb39af5",
        "name": "Tobias",
      },
      {
        "id": "662fd100f990557384756e58",
        "name": "Apex",
      },
    ];

    if (throwError) {
      throw Exception();
    }

    return List.from(data).map((json) {
      return CompanyModel.fromJson(json);
    }).toList();
  }
}
