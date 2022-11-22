class Notification {
  late int id;
  late int senderId;
  late int receiverId;
  late String title;
  late String body;
  late String imageUrl;
  late String createdAtDifferenceForHumans;
  String? createdAt;
  String? updatedAt;

  Notification({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.createdAtDifferenceForHumans,
    this.createdAt,
    this.updatedAt,
  });

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    title = json['title'];
    body = json['body'];
    imageUrl = json['image_url'];
    createdAtDifferenceForHumans = json['created_at_difference_for_humans'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class NotificationsParams {
  late int id;
  late String name;
  late String slug;
  String? createdAt;
  String? updatedAt;
  late NotificationsParamsPivot pivot;

  NotificationsParams({required this.id, required this.name, required this.slug, this.createdAt, this.updatedAt, required this.pivot});

  NotificationsParams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = new NotificationsParamsPivot.fromJson(json['pivot']);
  }
}

class NotificationsParamsPivot {
  late int professionalId;
  late int notificationTypeId;
  late int establishmentId;
  late bool active;

  NotificationsParamsPivot({required this.professionalId, required this.notificationTypeId, required this.establishmentId, required this.active});

  NotificationsParamsPivot.fromJson(Map<String, dynamic> json) {
    professionalId = json['professional_id'];
    notificationTypeId = json['notification_type_id'];
    establishmentId = json['establishment_id'];
    active = json['active'] == 1;
  }
}
