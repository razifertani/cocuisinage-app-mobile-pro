import 'package:cocuisinage_app_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro/models/role_permission.dart';

class Collegue {
  late int id;
  late String firstName;
  late String lastName;
  late String email;
  // late String profilePhotoPath;
  late String imageUrl;
  String? phoneNumber;
  String? addressLineOne;
  String? addressLineTwo;
  String? zipCode;
  String? country;
  late int companyId;
  String? createdAt;
  String? updatedAt;
  late List<EstablishmentsRoles> establishmentsRoles;
  late List<EstablishmentsPermissions> establishmentsPermissions;
  late List<Planning> plannings;

  Collegue({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    // required this.profilePhotoPath,
    required this.imageUrl,
    this.phoneNumber,
    this.addressLineOne,
    this.addressLineTwo,
    this.zipCode,
    this.country,
    required this.companyId,
    this.createdAt,
    this.updatedAt,
    required this.establishmentsRoles,
    required this.establishmentsPermissions,
    required this.plannings,
  });

  Collegue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    // profilePhotoPath = json['profile_photo_path'];
    imageUrl = json['image_url'];
    phoneNumber = json['phone_number'];
    addressLineOne = json['address_line_one'];
    addressLineTwo = json['address_line_two'];
    zipCode = json['zip_code'];
    country = json['country'];
    companyId = json['company_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['establishments_roles'] != null) {
      establishmentsRoles = <EstablishmentsRoles>[];
      json['establishments_roles'].forEach((v) {
        establishmentsRoles.add(new EstablishmentsRoles.fromJson(v));
      });
    }
    if (json['establishments_permissions'] != null) {
      establishmentsPermissions = <EstablishmentsPermissions>[];
      json['establishments_permissions'].forEach((v) {
        establishmentsPermissions.add(new EstablishmentsPermissions.fromJson(v));
      });
    }
    if (json['plannings'] != null) {
      plannings = <Planning>[];
      json['plannings'].forEach((v) {
        plannings.add(new Planning.fromJson(v));
      });
    }
  }
}
