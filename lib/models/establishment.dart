import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/collegue.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/reservation.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/table.dart';
import 'package:intl/intl.dart';

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
  late int bookingDuration;
  String? createdAt;
  String? updatedAt;
  late List<Collegue> collegues;
  List<Planning>? plannings;
  late List<Reservation> reservations;
  late List<Table> tables;
  late List<Schedule> schedules;

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
    required this.bookingDuration,
    this.createdAt,
    this.updatedAt,
    required this.collegues,
    this.plannings,
    required this.reservations,
    required this.tables,
    required this.schedules,
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
    bookingDuration = json['booking_duration'];
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
    if (json['tables'] != null) {
      tables = <Table>[];
      json['tables'].forEach((v) {
        tables.add(new Table.fromJson(v));
      });
    }
    if (json['schedules'] != null) {
      schedules = <Schedule>[];
      json['schedules'].forEach((v) {
        schedules.add(new Schedule.fromJson(v));
      });
    }
  }
}

class Schedule {
  late int id;
  late int establishmentId;
  late int day;
  DateTime? begin;
  DateTime? ending;
  DateTime? secondBegin;
  DateTime? secondEnd;

  Schedule({required this.id, required this.establishmentId, required this.day, this.begin, this.ending, this.secondBegin, this.secondEnd});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    establishmentId = json['establishment_id'];
    day = int.parse(json['day']);
    begin = json['begin'] != null ? DateFormat.Hm().parse(json['begin']) : null;
    ending = json['ending'] != null ? DateFormat.Hm().parse(json['ending']) : null;
    secondBegin = json['second_begin'] != null ? DateFormat.Hm().parse(json['second_begin']) : null;
    secondEnd = json['second_end'] != null ? DateFormat.Hm().parse(json['second_end']) : null;
  }
}
