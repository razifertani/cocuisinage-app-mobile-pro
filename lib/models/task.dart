class Task {
  static const IGNORED = 0;
  static const IGNORED_TEXT = 'Pas encore';
  static const DECLINED = -1;
  static const DECLINED_TEXT = 'Refusée';
  static const ACCEPTED = 1;
  static const ACCEPTED_TEXT = 'Acceptée';

  late int id;
  late int professionalId;
  late int establishmentId;
  late String name;
  late int status;
  String? comment;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  Task({required this.id, required this.professionalId, required this.establishmentId, required this.name, required this.status, this.comment, this.imageUrl, this.createdAt, this.updatedAt});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    professionalId = json['professional_id'];
    establishmentId = json['establishment_id'];
    name = json['name'];
    status = json['status'];
    comment = json['comment'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
