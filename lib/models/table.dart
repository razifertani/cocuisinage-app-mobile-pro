import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/reservation.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';

class Table {
  late int id;
  late int establishmentId;
  late String name;
  late String nbPersons;
  String? createdAt;
  String? updatedAt;
  late List<Reservation> reservations;

  Table({
    required this.id,
    required this.establishmentId,
    required this.name,
    required this.nbPersons,
    this.createdAt,
    this.updatedAt,
    required this.reservations,
  });

  Table.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    establishmentId = json['establishment_id'];
    name = json['name'];
    nbPersons = json['nb_people'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['reservations'] != null) {
      reservations = <Reservation>[];
      json['reservations'].forEach((v) {
        reservations.add(new Reservation.fromJson(v));
      });
    }
  }

  List<Reservation> getReservationsAtDateTime(DateTime dateTime) {
    List<Reservation> reservations = [];
    this.reservations.forEach((element) {
      // print('Test: ' + '${int.parse(element.hour.split(':').first)}');
      // print('Test: ' + '${dateTime.hour}');
      if (element.day.isSameDayAs(dateTime) && int.parse(element.hour.split(':').first) == dateTime.hour) {
        reservations.add(element);
      }
    });
    return reservations;
  }

  bool isFreeAtDateTime(DateTime dateTime) {
    bool isFree = true;
    this.reservations.forEach((element) {
      if (element.day.isSameDayAs(dateTime)) {
        // if (!
        // (
        //   dateTime
        // .isAfter(DateTime(dateTime.year, dateTime.month, dateTime.day, int.parse(element.hour.split(':')[0]),
        // int.parse(element.hour.split(':')[1])).add(Duration(hours: 1)))
        // )
        // ||
        // (
        //   dateTime.add(Duration(hours: 1))
        // .isBefore(DateTime(dateTime.year, dateTime.month, dateTime.day, int.parse(element.hour.split(':')[0]),
        // int.parse(element.hour.split(':')[1])))
        // )
        // ) {
        if (int.parse(element.hour.split(':').first) == dateTime.hour) {
          isFree = false;
        }
      }
    });

    return isFree;
  }
}
