import 'package:intl/intl.dart';

class Reservation {
  late int id;
  late int establishmentId;
  late String clientName;
  late String clientPhoneNumber;
  late int nbPeople;
  late DateTime day;
  late String hour;
  String? comment;
  late String createdAt;
  String? updatedAt;

  Reservation({
    required this.id,
    required this.establishmentId,
    required this.clientName,
    required this.clientPhoneNumber,
    required this.nbPeople,
    required this.day,
    required this.hour,
    this.comment,
    required this.createdAt,
    this.updatedAt,
  });

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    establishmentId = json['establishment_id'];
    clientName = json['client_name'];
    clientPhoneNumber = json['client_phone_number'];
    nbPeople = json['nb_people'];
    day = DateFormat("yyyy-MM-dd").parse(json['day']);
    hour = json['hour'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
