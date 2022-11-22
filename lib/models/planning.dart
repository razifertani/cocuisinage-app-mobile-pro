import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/task.dart';
import 'package:intl/intl.dart';

class Planning {
  static const NOT_YET = 0;
  static const NOT_YET_TEXT = 'Non pointé';
  static const IN_PROGRESS = 1;
  static const IN_PROGRESS_TEXT = 'En cours';
  static const DONE = 2;
  static const DONE_TEXT = 'Pointé';

  static Map<String, List<double>> DAY_PARTS = {
    'nuit': [00.00, 06.00],
    'matin': [06.00, 12.00],
    'après-midi': [12.00, 18.00],
    'soir': [18.00, 23.00],
  };

  late int id;
  late int professionalId;
  late int establishmentId;
  late DateTime day;
  late DateTime shouldStartAt;
  DateTime? shouldFinishAt;
  DateTime? startedAt;
  DateTime? finishedAt;
  late int status;
  String? createdAt;
  String? updatedAt;
  late List<Task> tasks;

  Planning({
    required this.id,
    required this.professionalId,
    required this.establishmentId,
    required this.day,
    required this.shouldStartAt,
    this.shouldFinishAt,
    this.startedAt,
    this.finishedAt,
    required this.status,
    this.createdAt,
    this.updatedAt,
    required this.tasks,
  });

  Planning.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    professionalId = json['professional_id'];
    establishmentId = json['establishment_id'];
    day = DateFormat("yyyy-MM-dd").parse(json['day']);
    shouldStartAt = DateFormat.Hm().parse(json['should_start_at']);
    shouldFinishAt = json['should_finish_at'] != null
        ? DateFormat.Hm().parse(json['should_finish_at'])
        : null;
    startedAt = json['started_at'] != null
        ? DateFormat.Hm().parse(json['started_at'])
        : null;
    finishedAt = json['finished_at'] != null
        ? DateFormat.Hm().parse(json['finished_at'])
        : null;
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['tasks'] != null) {
      tasks = <Task>[];
      json['tasks'].forEach((v) {
        tasks.add(new Task.fromJson(v));
      });
    }
  }

  bool isFixed() {
    return this.shouldFinishAt != null;
  }

  int getDelayInMinutes() {
    if (this.status == IN_PROGRESS) {
      return this.startedAt!.difference(this.shouldStartAt).inMinutes;
    } else if (this.status == DONE) {
      return this.startedAt!.difference(this.shouldStartAt).inMinutes +
          this.shouldFinishAt!.difference(this.finishedAt!).inMinutes;
    } else {
      return 0;
    }
  }
}
