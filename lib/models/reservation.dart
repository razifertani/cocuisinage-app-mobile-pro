import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/table.dart';
import 'package:intl/intl.dart';

class Reservation {
  late int id;
  late int establishmentId;
  int? tableId;
  late String clientName;
  late String? clientPhoneNumber;
  late int nbPeople;
  late DateTime day;
  late String hour;
  String? comment;
  late String createdAt;
  String? updatedAt;
  Table? table;

  Reservation({
    required this.id,
    required this.establishmentId,
    this.tableId,
    required this.clientName,
    required this.clientPhoneNumber,
    required this.nbPeople,
    required this.day,
    required this.hour,
    this.comment,
    required this.createdAt,
    this.updatedAt,
    this.table,
  });

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    establishmentId = json['establishment_id'];
    tableId = json['table_id'];
    clientName = json['client_name'];
    clientPhoneNumber = json['client_phone_number'];
    nbPeople = json['nb_people'];
    day = DateFormat("yyyy-MM-dd").parse(json['day']);
    hour = json['hour'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    table = json['table'] != null ? new Table.fromJson(json['table']) : null;
  }
}
