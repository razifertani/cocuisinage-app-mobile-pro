class Config {
  late List<Role> roles;
  late List<Permission> permissions;

  Config({
    required this.roles,
    required this.permissions,
  });
}

class Role {
  static const PATRON = 1;

  late int id;
  late String name;
  late int? establishmentId;
  String? guardName;
  String? createdAt;
  String? updatedAt;
  late List<Permission> permissions;

  Role({required this.id, required this.name, required this.establishmentId, this.guardName, this.createdAt, this.updatedAt, required this.permissions});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    establishmentId = json['establishment_id'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['permissions'] != null) {
      permissions = <Permission>[];
      json['permissions'].forEach((v) {
        permissions.add(new Permission.fromJson(v));
      });
    }
  }
}

class Permission {
  static const ADD_COLLABORATORS = 1;
  static const ADD_TASKS_TO_THE_TEAM = 2;
  static const MANAGE_ROLES = 3;
  static const REMOTE_WORK = 4;
  static const FREE_WORK = 5;

  late int id;
  late String name;
  String? guardName;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Permission({required this.id, required this.name, this.guardName, this.createdAt, this.updatedAt, required this.pivot});

  Permission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }
}

class Pivot {
  late int roleId;
  late int permissionId;

  Pivot({required this.roleId, required this.permissionId});

  Pivot.fromJson(Map<String, dynamic> json) {
    roleId = json['role_id'];
    permissionId = json['permission_id'];
  }
}

class EstablishmentsRoles {
  late int id;
  late int companyId;
  late String name;
  String? slogan;
  String? type;
  String? address;
  String? city;
  String? zipCode;
  String? longitude;
  String? latitude;
  String? description;
  late String imageUrl;
  String? createdAt;
  String? updatedAt;
  late PivotEstablishmentsRoles pivotEstablishmentsRoles;

  EstablishmentsRoles({required this.id, required this.companyId, required this.name, this.slogan, this.type, this.address, this.city, this.zipCode, this.longitude, this.latitude, this.description, required this.imageUrl, this.createdAt, this.updatedAt, required this.pivotEstablishmentsRoles});

  EstablishmentsRoles.fromJson(Map<String, dynamic> json) {
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
    pivotEstablishmentsRoles = new PivotEstablishmentsRoles.fromJson(json['pivot']);
  }
}

class EstablishmentsPermissions {
  late int id;
  late int companyId;
  late String name;
  String? slogan;
  String? type;
  String? address;
  String? city;
  String? zipCode;
  String? longitude;
  String? latitude;
  String? description;
  late String imageUrl;
  String? createdAt;
  String? updatedAt;
  late PivotEstablishmentsPermissions pivotEstablishmentsPermissions;

  EstablishmentsPermissions({required this.id, required this.companyId, required this.name, this.slogan, this.type, this.address, this.city, this.zipCode, this.longitude, this.latitude, this.description, required this.imageUrl, this.createdAt, this.updatedAt, required this.pivotEstablishmentsPermissions});

  EstablishmentsPermissions.fromJson(Map<String, dynamic> json) {
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
    pivotEstablishmentsPermissions = new PivotEstablishmentsPermissions.fromJson(json['pivot']);
  }
}

class PivotEstablishmentsRoles {
  late int professionalId;
  late int establishmentId;
  late int roleId;

  PivotEstablishmentsRoles({required this.professionalId, required this.establishmentId, required this.roleId});

  PivotEstablishmentsRoles.fromJson(Map<String, dynamic> json) {
    professionalId = json['professional_id'];
    establishmentId = json['establishment_id'];
    roleId = json['role_id'];
  }
}

class PivotEstablishmentsPermissions {
  late int professionalId;
  late int establishmentId;
  late int permissionId;

  PivotEstablishmentsPermissions({required this.professionalId, required this.establishmentId, required this.permissionId});

  PivotEstablishmentsPermissions.fromJson(Map<String, dynamic> json) {
    professionalId = json['professional_id'];
    establishmentId = json['establishment_id'];
    permissionId = json['permission_id'];
  }
}

class Params {
  int? currentEstablishmentID;

  Params({
    this.currentEstablishmentID,
  });
}
