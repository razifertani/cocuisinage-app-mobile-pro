import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/collegue.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/company.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/establishment.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/notification.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/reservation.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/role_permission.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/task.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';

class Profile {
  late int id;
  late String firstName;
  late String lastName;
  late String email;
  String? emailVerifiedAt;
  String? apiToken;
  int? currentTeamId;
  // late String profilePhotoPath;
  late String imageUrl;
  String? phoneNumber;
  String? addressLineOne;
  String? addressLineTwo;
  String? zipCode;
  String? country;
  late int companyId;
  late bool isOwner;
  String? fcmToken;
  String? createdAt;
  String? updatedAt;
  late Company company;
  late List<EstablishmentsRoles> establishmentsRoles;
  late List<EstablishmentsPermissions> establishmentsPermissions;
  late List<Planning> plannings;
  late List<Task> tasks;
  late List<NotificationsParams> notificationsParams;
  late List<Notification> notificationsAsSender;
  late List<Notification> notificationsAsReceiver;

  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.emailVerifiedAt,
    this.apiToken,
    this.currentTeamId,
    // required this.profilePhotoPath,
    required this.imageUrl,
    this.phoneNumber,
    this.addressLineOne,
    this.addressLineTwo,
    this.zipCode,
    this.country,
    required this.companyId,
    required this.isOwner,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
    required this.company,
    required this.establishmentsRoles,
    required this.establishmentsPermissions,
    required this.plannings,
    required this.tasks,
    required this.notificationsParams,
    required this.notificationsAsSender,
    required this.notificationsAsReceiver,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    apiToken = json['api_token'];
    currentTeamId = json['current_team_id'];
    // profilePhotoPath = json['profile_photo_path'];
    imageUrl = json['image_url'];
    phoneNumber = json['phone_number'];
    addressLineOne = json['address_line_one'];
    addressLineTwo = json['address_line_two'];
    zipCode = json['zip_code'];
    country = json['country'];
    companyId = json['company_id'];
    isOwner = json['is_owner'] == 1;
    fcmToken = json['fcm_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    company = new Company.fromJson(json['company']);
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
    if (json['tasks'] != null) {
      tasks = <Task>[];
      json['tasks'].forEach((v) {
        tasks.add(new Task.fromJson(v));
      });
    }
    if (json['notifications_params'] != null) {
      notificationsParams = <NotificationsParams>[];
      json['notifications_params'].forEach((v) {
        notificationsParams.add(new NotificationsParams.fromJson(v));
      });
    }
    if (json['notifications_as_sender'] != null) {
      notificationsAsSender = <Notification>[];
      json['notifications_as_sender'].forEach((v) {
        notificationsAsSender.add(new Notification.fromJson(v));
      });
    }
    if (json['notifications_as_receiver'] != null) {
      notificationsAsReceiver = <Notification>[];
      json['notifications_as_receiver'].forEach((v) {
        notificationsAsReceiver.add(new Notification.fromJson(v));
      });
    }
  }

  String getFullName() {
    return this.firstName + ' ' + this.lastName;
  }

  Establishment getEstablishment() {
    return this.company.establishments.firstWhere((element) {
      return element.id ==
          this.establishmentsRoles.firstWhere((element) {
            return element.id == Globals.params.currentEstablishmentID;
          }).id;
    });
  }

  EstablishmentsRoles getEstablishmentRole() {
    return this.establishmentsRoles.firstWhere((element) {
      return element.id == Globals.params.currentEstablishmentID;
    });
  }

  Role getRole() {
    return Globals.config.roles.firstWhere((element) {
      return element.id ==
          this
              .establishmentsRoles
              .firstWhere((element) {
                return element.id == Globals.params.currentEstablishmentID;
              })
              .pivotEstablishmentsRoles
              .roleId;
    });
  }

  List<EstablishmentsPermissions> getPermissions() {
    return this.establishmentsPermissions.where((element) {
      return element.id == Globals.params.currentEstablishmentID;
    }).toList();
  }

  List<Collegue> getColleagues() {
    return this.company.establishments.firstWhere((element) {
      return element.id == Globals.params.currentEstablishmentID;
    }).collegues;
  }

  Collegue getColleague({required int id}) {
    return this
        .company
        .establishments
        .firstWhere((element) {
          return element.id == Globals.params.currentEstablishmentID;
        })
        .collegues
        .firstWhere((element) {
          return element.id == id;
        });
  }

  Role getColleagueRole({required int id}) {
    return Globals.config.roles.firstWhere((element) {
      return element.id ==
          this
              .getColleague(id: id)
              .establishmentsRoles
              .firstWhere((element) {
                return element.id == Globals.params.currentEstablishmentID;
              })
              .pivotEstablishmentsRoles
              .roleId;
    });
  }

  List<int> getColleguePermissions({required int id}) {
    List<int> colleguePermissionsIDs = [];
    Iterable<EstablishmentsPermissions> establishmentsPermissions = this.getColleague(id: id).establishmentsPermissions.where((element) {
      return element.id == Globals.params.currentEstablishmentID;
    });
    establishmentsPermissions.forEach((establishmentsPermissionsElement) {
      Globals.config.permissions.forEach((permissionElement) {
        if (establishmentsPermissionsElement.pivotEstablishmentsPermissions.permissionId == permissionElement.id) {
          colleguePermissionsIDs.add(permissionElement.id);
        }
      });
    });

    return colleguePermissionsIDs;
  }

  List<Planning> getMyPlanningsForToday() {
    return this.plannings.where((element) {
      return element.day.isSameDayAs(DateTime.now());
    }).toList();
  }

  List<Task> getMyTasksForToday() {
    List<Task> tasks = [];

    this.getMyPlanningsForToday().forEach((planning) {
      planning.tasks.forEach((task) {
        tasks.add(task);
      });
    });
    return tasks;
  }

  List<Planning> getColleguePlanningsForDate({required int collegueID, required DateTime date}) {
    return this.getColleague(id: collegueID).plannings.where((element) {
      return element.day.isSameDayAs(date) && element.isFixed();
    }).toList();
  }

  bool isAvailableTargetPlanningForNow() {
    List<Planning> plannings = this.plannings.where((element) {
      return element.day.isSameDayAs(DateTime.now());
    }).toList();

    bool isAvailableTargetPlanningForNow = false;
    plannings.forEach((element) {
      if (!element.isFixed()) {
        isAvailableTargetPlanningForNow = true;
      } else if (element.startedAt == null || element.finishedAt == null) {
        if (DateTime.now().isAfter(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, element.shouldStartAt.hour, element.shouldStartAt.minute)) && DateTime.now().isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, element.shouldFinishAt!.hour, element.shouldFinishAt!.minute))) {
          isAvailableTargetPlanningForNow = true;
        }
      }
    });

    return isAvailableTargetPlanningForNow;
  }

  Planning getAvailableTargetPlanningForNow() {
    List<Planning> plannings = this.plannings.where((element) {
      return element.day.isSameDayAs(DateTime.now());
    }).toList();

    return plannings.firstWhere((element) {
      if (!element.isFixed()) {
        return true;
      } else if (element.startedAt == null || element.finishedAt == null) {
        if (element.shouldFinishAt == null) {
          return true;
        } else if (DateTime.now().isAfter(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, element.shouldStartAt.hour, element.shouldStartAt.minute)) && DateTime.now().isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, element.shouldFinishAt!.hour, element.shouldFinishAt!.minute))) {
          return true;
        }
      }
      return false;
    });
  }

  List<Planning> getColleguesPlanningsToday() {
    List<Planning> currentColleguePlannings = [];

    this.getColleagues().forEach((currentCollegue) {
      currentCollegue.plannings.forEach((currentColleguePlanning) {
        if (DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).isSameDayAs(currentColleguePlanning.day)) {
          currentColleguePlannings.add(currentColleguePlanning);
        }
      });
    });

    return currentColleguePlannings;
  }

  List<Planning> getColleguePlanningsByPart({required DateTime dateTime, required int part}) {
    List<Planning> currentColleguePlannings = [];

    this.getColleagues().forEach((currentCollegue) {
      currentCollegue.plannings.forEach((currentColleguePlanning) {
        if (currentColleguePlanning.isFixed() && dateTime.isSameDayAs(currentColleguePlanning.day)) {
          if ((Planning.DAY_PARTS.values.elementAt(part).first <= double.parse("${currentColleguePlanning.shouldStartAt.hour}.${currentColleguePlanning.shouldStartAt.minute}") && double.parse("${currentColleguePlanning.shouldStartAt.hour}.${currentColleguePlanning.shouldStartAt.minute}") <= Planning.DAY_PARTS.values.elementAt(part).last) ||
              (Planning.DAY_PARTS.values.elementAt(part).first <= double.parse("${currentColleguePlanning.shouldFinishAt!.hour}.${currentColleguePlanning.shouldFinishAt!.minute}") && double.parse("${currentColleguePlanning.shouldFinishAt!.hour}.${currentColleguePlanning.shouldFinishAt!.minute}") <= Planning.DAY_PARTS.values.elementAt(part).last)) {
            currentColleguePlannings.add(currentColleguePlanning);
          }
        }
      });
    });

    return currentColleguePlannings;
  }

  List<Planning> getColleguePlanningsForPart({required int collegueID, required DateTime dateTime, required int part}) {
    List<Planning> plannings = [];

    this.getColleague(id: collegueID).plannings.forEach((currentColleguePlanning) {
      if (currentColleguePlanning.isFixed() && dateTime.isSameDayAs(currentColleguePlanning.day)) {
        if ((Planning.DAY_PARTS.values.elementAt(part).first <= double.parse("${currentColleguePlanning.shouldStartAt.hour}.${currentColleguePlanning.shouldStartAt.minute}") && double.parse("${currentColleguePlanning.shouldStartAt.hour}.${currentColleguePlanning.shouldStartAt.minute}") <= Planning.DAY_PARTS.values.elementAt(part).last) ||
            (Planning.DAY_PARTS.values.elementAt(part).first <= double.parse("${currentColleguePlanning.shouldFinishAt!.hour}.${currentColleguePlanning.shouldFinishAt!.minute}") && double.parse("${currentColleguePlanning.shouldFinishAt!.hour}.${currentColleguePlanning.shouldFinishAt!.minute}") <= Planning.DAY_PARTS.values.elementAt(part).last)) {
          plannings.add(currentColleguePlanning);
        }
      }
    });

    return plannings;
  }

  List<Task> getCollegueTasksForPart({required int collegueID, required DateTime dateTime, required int part}) {
    List<Task> tasks = [];

    this.getColleguePlanningsForPart(collegueID: collegueID, dateTime: dateTime, part: part).forEach((element) {
      element.tasks.forEach((element) {
        tasks.add(element);
      });
    });

    return tasks;
  }

  List<NotificationsParams> getNotificationsParamsForEstablishment() {
    return this.notificationsParams.where((element) => element.pivot.establishmentId == Globals.params.currentEstablishmentID).toList();
  }

  List<Reservation> getReservationsForDate({required DateTime day}) {
    return this.getEstablishment().reservations.where((element) {
      return element.day.isSameDayAs(day);
    }).toList();
  }

  String getPercentageForDate({required DateTime date}) {
    int numberOfReservations = 0;
    this.getEstablishment().reservations.forEach((element) {
      if (element.day.isSameDayAs(date)) {
        numberOfReservations++;
      }
    });
    return ((numberOfReservations * 100) / 24).toStringAsFixed(2);
  }
}
