import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/collegue.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/reservation.dart';

class Establishment {
  late int id;
  late int companyId;
  late String name;
  String? slogan;
  String? type;
  String? address;
  String? city;
  String? zipCode;
  late String longitude;
  late String latitude;
  String? description;
  late String imageUrl;
  String? createdAt;
  String? updatedAt;
  late List<Collegue> collegues;
  List<Planning>? plannings;
  late List<Reservation> reservations;

  Establishment({
    required this.id,
    required this.companyId,
    required this.name,
    this.slogan,
    this.type,
    this.address,
    this.city,
    this.zipCode,
    required this.longitude,
    required this.latitude,
    this.description,
    required this.imageUrl,
    this.createdAt,
    this.updatedAt,
    required this.collegues,
    this.plannings,
    required this.reservations,
  });

  Establishment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    slogan = json['slogan'];
    type = json['type'];
    address = json['address'];
    city = json['city'];
    zipCode = json['zip_code'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    description = json['description'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['professionals'] != null) {
      collegues = <Collegue>[];
      json['professionals'].forEach((v) {
        collegues.add(new Collegue.fromJson(v));
      });
    }
    if (json['plannings'] != null) {
      plannings = <Planning>[];
      json['plannings'].forEach((v) {
        plannings!.add(new Planning.fromJson(v));
      });
    }
    if (json['reservations'] != null) {
      reservations = <Reservation>[];
      json['reservations'].forEach((v) {
        reservations.add(new Reservation.fromJson(v));
      });
    }
  }
}
