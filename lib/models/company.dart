import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/establishment.dart';

class Company {
  late int id;
  late String name;
  String? email;
  String? phoneNumber;
  String? rib;
  String? siret;
  String? createdAt;
  String? updatedAt;
  late List<Establishment> establishments;

  Company(
      {required this.id,
      required this.name,
      this.email,
      this.phoneNumber,
      this.rib,
      this.siret,
      this.createdAt,
      this.updatedAt,
      required this.establishments});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    rib = json['rib'];
    siret = json['siret'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['establishments'] != null) {
      establishments = <Establishment>[];
      json['establishments'].forEach((v) {
        establishments.add(new Establishment.fromJson(v));
      });
    }
  }
}
