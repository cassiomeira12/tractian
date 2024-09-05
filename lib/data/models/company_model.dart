import 'package:tractian/domain/domain.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel({
    required super.id,
    required super.name,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
